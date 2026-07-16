{ den, ... }: {
  den.aspects.desktop = {
    includes = [ den.aspects.basic ];

    nixos = { pkgs, lib, ... }: {
      # pipewire
      environment.systemPackages = with pkgs; [ wiremix ];
      services.pipewire = {
        enable = true;
        alsa.enable = true;
      };

      # UWSM
      programs.uwsm.enable = true;

      # hyprland
      programs.uwsm.waylandCompositors.hyprland = {
        prettyName = "Hyprland";
        comment = "Hyprland compositor managed by UWSM";
        binPath = "/run/current-system/sw/bin/Hyprland";
      };
      programs.hyprland = {
        enable = true;
        withUWSM = true;
        xwayland.enable = false;
      };

      # niri
      programs.uwsm.waylandCompositors.niri = {
        prettyName = "Niri";
        comment = "Niri compositor managed by UWSM";
        binPath = "/run/current-system/sw/bin/niri";
      };
      programs.niri.enable = true;

      # greetd + regreet
      services.greetd.enable = true;
      programs.regreet.enable = true;

      # alacritty fonts
      fonts.packages = with pkgs; [ fira-code nerd-fonts.fira-code font-awesome ];
    };

    homeManager = { pkgs, config, lib, ... }: {
      # alacritty
      programs.alacritty = {
        enable = true;
        settings.font.normal.family = "FiraCode Nerd Font Mono";
      };
      wayland.windowManager.hyprland.settings."$terminal" =
        lib.mkOverride 100 "${lib.getExe pkgs.alacritty}";

      # hyprland config
      wayland.windowManager.hyprland = {
        enable = true;
        systemd = {
          enable = true;
          variables = [ "--all" ];
        };
        configType = "hyprlang";
        settings = {
          monitor = [
            "eDP-1, 2560x1440@60, 2560x0, auto"
            "HDMI-A-1, 2560x1440@60, 0x0, auto"
          ];
          "$mod" = "SUPER";
          device = {
            name = "at-translated-set-2-keyboard";
            kb_layout = "us";
            kb_variant = "norman";
            kb_options = "ctrl:swapcaps";
            resolve_binds_by_sym = "1";
          };
          env = [ "XCURSOR_SIZE,24" "HYPRCURSOR_SIZE,24" ];
          general = { gaps_in = 2; gaps_out = 4; border_size = 2; layout = "master"; };
          decoration = { rounding = 2; inactive_opacity = 0.94; active_opacity = 1.0; };
          master = { mfact = 0.45; new_status = "master"; orientation = "right"; };
          animations.enabled = true;
          xwayland.enabled = false;
          bind = [
            "$mod, Return, exec, $terminal"
            "$mod, S, exec, ${lib.getExe pkgs.slurp} | ${lib.getExe pkgs.grim} -g - | ${lib.getExe pkgs.swappy} -f -"
            "$mod, P, exec, $menu"
            "$mod, Q, killactive"
            "$mod, Space, togglefloating"
            "$mod, F, fullscreen"
            "$mod, K, layoutmsg, cycleprev"
            "$mod, J, layoutmsg, cyclenext"
            "$mod, G, layoutmsg, swapprev"
            "$mod, Y, layoutmsg, swapnext"
            "$mod, A, layoutmsg, swapwithmaster"
            "$mod, R, layoutmsg, orientationright"
            "$mod, H, layoutmsg, mfact, -0.2"
            "$mod, L, layoutmsg, mfact, +0.2"
            "$mod SHIFT, Q, exit"
            "$mod, M, togglespecialworkspace, magic"
            "$mod SHIFT, M, movetoworkspace, special:magic"
          ] ++ (let
            mkWorkspaceRule = idx: let
              ws = toString (idx + 1);
            in [
              "$mod, ${ws}, workspace, ${ws}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${ws}"
            ];
          in builtins.concatLists (builtins.genList mkWorkspaceRule 9));
        };
      };

      # waybar
      programs.waybar = {
        enable = true;
        systemd.enable = true;
        settings.main = {
          position = "bottom";
          modules-left = lib.mkOrder 100 [ "clock" ]
            ++ lib.mkOrder 101 [ "hyprland/workspaces" "hyprland/window" ];
          modules-right = lib.mkOrder 10000 [ "network" "cpu" "memory" "battery" "tray" ];
          clock = {
            interval = 1;
            format = "{:%r %a %b %d}";
            tooltip = true;
            tooltip-format = "<tt>{calendar}</tt>";
            timezone = "Asia/Shanghai";
          };
          network = { format-disconnected = "{disconnected}"; format-wifi = "{essid}"; interval = 1; };
          cpu = { interval = 1; format = "{usage:02}%"; states.warning = 95; };
          memory = { interval = 1; format = "{percentage:02}%"; states.warning = 85; };
          battery = {
            interval = 10; full-at = 99;
            states = { good = 90; warning = 30; critical = 15; };
            format = "{icon}  {capacity}%"; format-charging = "{capacity}%"; format-plugged = "{capacity}%";
            format-icons = [ "" "" "" "" "" ];
          };
          tray = { icon-size = 14; show-passive-items = true; spacing = 5; };
          "hyprland/workspaces" = {
            persistent-workspaces = builtins.listToAttrs (
              builtins.genList (idx: { name = toString (idx + 1); value = [ ]; }) 9
            );
            all-outputs = true;
          };
        };
        style = ''
          * { border: none; border-radius: 0; font-family: FontAwesome, Roboto, Helvetica, Arial, sans-serif; font-size: 14px; min-height: 0; }
          window#waybar { color: #dfdfdf; background: #222222; }
          #window { padding: 1px 2px; margin: 1px 12px; border-bottom: 2px solid transparent; }
          label.module { padding: 1px 2px; margin: 1px 6px; }
          #workspaces button { padding: 1px 2px; margin: 1px 1px; color: #444444; border-bottom: 2px solid transparent; }
          #workspaces button.hosting-monitor { color: #dfdfdf; }
          #workspaces button.active.hosting-monitor { border-bottom: 2px solid #d65d0e; }
          #workspaces button.empty { color: #444444; }
          #workspaces button.urgent { background: #cc241d; }
          #clock { padding: 1px 6px; margin: 1px 10px; border-bottom: 2px solid #076678; }
          #battery { border-bottom: 2px solid #cc241d; }
          #memory { border-bottom: 2px solid #98971a; }
          #cpu { border-bottom: 2px solid #427b58; }
          #network { border-bottom: 2px solid #8f3f71; }
          #tray { padding: 1px 2px; margin: 1px 6px; border-bottom: 2px solid #ffaa00; }
          tooltip { background: rgba(43, 48, 59, 0.8); border: 2px solid rgba(100, 114, 125, 0.9); }
          tooltip label { color: white; }
        '';
      };

      # wpaperd
      services.wpaperd = {
        enable = true;
        settings = {
          default = { duration = "5m"; mode = "stretch"; sorting = "random"; };
          any.path = "${config.home.homeDirectory}/res/images/wallpaper";
        };
      };

      # bibata cursor
      home.pointerCursor = {
        gtk.enable = true;
        package = lib.mkDefault pkgs.bibata-cursors;
        name = "Bibata-Modern-Ice";
        size = 16;
      };

      # mako
      services.mako.enable = true;

      # chromium
      programs.chromium.enable = true;

      # fcitx5
      i18n.inputMethod = {
        enable = true;
        type = "fcitx5";
        fcitx5 = {
          addons = with pkgs; [
            fcitx5-gtk qt6Packages.fcitx5-chinese-addons
            fcitx5-pinyin-zhwiki fcitx5-tokyonight libsForQt5.fcitx5-qt
          ];
          waylandFrontend = true;
          settings = {
            globalOptions = { };
            inputMethod = {
              "Groups/0" = { "Name" = "Default"; "Default Layout" = "us"; "DefaultIM" = "shuangpin"; };
              "Groups/0/Items/0" = { "Name" = "keyboard-us"; "Layout" = ""; };
              "Groups/0/Items/1" = { "Name" = "shuangpin"; "Layout" = ""; };
              "GroupOrder" = { "0" = "Default"; };
            };
            addons.pinyin = {
              globalSection = { ShuangpinProfile = "Custom"; ShuangpinMode = true; PageSize = 7; };
              sections = { };
            };
          };
        };
      };
      xdg.configFile = {
        "fcitx5/pinyin/sp.dat".source = (pkgs.formats.ini { }).generate "sp.dat" {
          "方案"."方案名称" = "custom";
          "零声母标识"."''" = "O";
          "声母" = { ch = "I"; sh = "U"; zh = "V"; };
          "韵母" = {
            ai = "D"; an = "N"; ang = "Y"; ao = "C";
            ei = "W"; en = "T"; eng = "G"; er = "R";
            ia = "X"; ian = "M"; iang = "L"; iao = "B";
            ie = "H"; "in" = "P"; ing = "F"; iong = "S";
            iu = "Q"; ong = "S"; ou = "Z";
            ua = "X"; uai = "F"; uan = "R"; uang = "L";
            ue = "K"; ui = "V"; un = "J"; uo = "O";
          };
        };
        "fcitx5".recursive = true;
      };

      # hypridle + hyprlock
      services.hypridle = {
        enable = true;
        settings = {
          general = {
            after_sleep_cmd = "hyprctl dispatch dpms on";
            ignore_dbus_inhibit = false;
            lock_cmd = "hyprlock";
          };
          listener = [
            { timeout = 900; on-timeout = "hyprlock"; }
            { timeout = 1200; on-timeout = "hyprctl dispatch dpms off"; on-resume = "hyprctl dispatch dpms on"; }
          ];
        };
      };

      programs.hyprlock = {
        enable = true;
        settings = {
          general = { disable_loading_bar = true; grace = 300; hide_cursor = true; no_fade_in = false; };
          background = [{ path = "screenshot"; blur_passes = 3; blur_size = 8; }];
          input-field = [{
            size = "200, 50"; position = "0, -80"; monitor = "";
            dots_center = true; fade_on_empty = false;
            font_color = "rgb(202, 211, 245)"; inner_color = "rgb(91, 96, 120)";
            outer_color = "rgb(24, 25, 38)"; outline_thickness = 5; shadow_passes = 2;
          }];
        };
      };

      # qutebrowser
      programs.qutebrowser = {
        enable = true;
        quickmarks = {
          y = "https://youtube.com"; g = "https://www.google.com"; ddg = "https://duckduckgo.com";
          gh = "https://github.com"; gl = "https://gitlab.com"; blog = "https://sereph.us";
          gb = "https://godbolt.org"; tr = "https://github.com/trending/rust?since=daily";
          ext = "https://ext.to"; cron = "https://crontab.guru"; cf = "https://cloudflare.com";
          lc = "https://leetcode.com"; lcr = "https://leetcode.com/problems/random-one-question/all";
        };
        searchEngines = {
          DEFAULT = "https://google.com/search?q={}";
          d = "https://duckduckgo.com/?q={}";
          y = "https://youtube.com/results?search_query={}";
          w = "https://en.wikipedia.org/wiki/Special:Search?search={}&go=Go&ns0=1";
          aw = "https://wiki.archlinux.org/?search={}";
          nw = "https://wiki.nixos.org/wiki/{}";
          no = "https://search.nixos.org/options?channel=unstable&query={}";
          g = "https://www.google.com/search?hl=en&q={}";
          r = "https://doc.rust-lang.org/stable/std/?search={}";
          c = "https://en.cppreference.com/w/cpp/keyword/{}";
          gh = "https://github.com/search/?q={}";
          rc = "https://crates.io/search/?q={}";
          rd = "https://docs.rs/releases/search?query={}";
        };
        settings = {
          tabs = { position = "bottom"; show = "multiple"; };
          zoom.default = "150%"; fonts.default_size = "16pt";
          confirm_quit = [ "downloads" ]; scrolling.smooth = true;
          downloads = {
            location = { suggestion = "filename"; directory = "${config.home.homeDirectory}/res/downloads"; };
            position = "bottom"; remove_finished = 8000;
          };
          colors = {
            hints = { fg = "#EFF0EB"; bg = "#1E1F29"; match.fg = "#5AF78E"; };
            webpage = { darkmode.enabled = true; preferred_color_scheme = "dark"; };
          };
          content = {
            geolocation = false; headers.do_not_track = true;
            cookies.accept = "no-3rdparty"; dns_prefetch = true; xss_auditing = true;
            blocking = {
              enabled = true; method = "both";
              adblock.lists = [
                "https://easylist.to/easylist/easylist.txt"
                "https://easylist.to/easylist/easyprivacy.txt"
                "https://secure.fanboy.co.nz/fanboy-cookiemonster.txt"
                "https://easylist.to/easylist/fanboy-annoyance.txt"
              ];
              hosts.lists = [ "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts" ];
            };
          };
        };
      };
    };
  };
}
