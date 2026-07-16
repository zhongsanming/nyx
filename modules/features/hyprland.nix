{ den, lib, pkgs, ... }: {
  den.aspects.hyprland = {
    nixos = {
      programs.uwsm.waylandCompositors.hyprland = {
        prettyName = "Hyprland";
        comment = "Hyprland compositor managed by UWSM";
        binPath = "/run/current-system/sw/bin/Hyprland";
      };
      programs.hyprland = { enable = true; withUWSM = true; xwayland.enable = false; };
    };
    homeManager = { pkgs, config, lib, ... }: {
      wayland.windowManager.hyprland = let
        workspaces = 9;
        mkWorkspaceRule = idx: let ws = toString (idx + 1); in [
          "$mod, ${ws}, workspace, ${ws}"
          "$mod SHIFT, ${ws}, movetoworkspace, ${ws}"
        ];
      in {
        enable = true;
        systemd = { enable = true; variables = [ "--all" ]; };
        configType = "hyprlang";
        settings = {
          monitor = [ "eDP-1, 2560x1440@60, 2560x0, auto" "HDMI-A-1, 2560x1440@60, 0x0, auto" ];
          "$mod" = "SUPER";
          device = {
            name = "at-translated-set-2-keyboard";
            kb_layout = "us"; kb_variant = "norman";
            kb_options = "ctrl:swapcaps"; resolve_binds_by_sym = "1";
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
            "$mod, Q, killactive" "$mod, Space, togglefloating" "$mod, F, fullscreen"
            "$mod, K, layoutmsg, cycleprev" "$mod, J, layoutmsg, cyclenext"
            "$mod, G, layoutmsg, swapprev" "$mod, Y, layoutmsg, swapnext"
            "$mod, A, layoutmsg, swapwithmaster" "$mod, R, layoutmsg, orientationright"
            "$mod, H, layoutmsg, mfact, -0.2" "$mod, L, layoutmsg, mfact, +0.2"
            "$mod SHIFT, Q, exit"
            "$mod, M, togglespecialworkspace, magic" "$mod SHIFT, M, movetoworkspace, special:magic"
          ] ++ builtins.concatLists (builtins.genList mkWorkspaceRule workspaces);
        };
      };
      # alacritty terminal ref
      programs.alacritty.settings.font.normal.family = "FiraCode Nerd Font Mono";
      wayland.windowManager.hyprland.settings."$terminal" =
        lib.mkOverride 100 "${lib.getExe pkgs.alacritty}";
    };
  };
}
