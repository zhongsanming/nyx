{ den, ... }: {
  den.aspects.basic = {
    includes = [ den.aspects.minimal ];

    nixos = { pkgs, lib, ... }: {
      # system packages (CLI tools)
      environment.systemPackages = with pkgs; [
        bottom fd jq ripgrep tealdeer helix man-pages man-pages-posix
      ];

      # git
      programs.git = {
        enable = true;
        config.init.defaultBranch = "main";
      };
      programs.fish.shellAbbrs = {
        ga = "git add";
        gs = "git status";
        gc = "git checkout";
        gcl = "git clone";
        gm = "git commit";
      };

      # fish shell
      programs.fish = {
        enable = true;
        shellAbbrs = {
          pb = "curl -F 'c=@-' 'https://fars.ee'";
          cargo-git = "cargo --config net.git-fetch-with-cli=true ";
        };
        interactiveShellInit = ''
          set -g __fish_git_prompt_char_dirtystate '+'
          set -g fish_greeting
          set -g fish_key_bindings fish_vi_key_bindings
        '';
      };

      # fonts
      fonts = {
        enableDefaultPackages = false;
        packages = with pkgs; [
          noto-fonts noto-fonts-color-emoji noto-fonts-cjk-sans
          noto-fonts-cjk-serif wqy_microhei lxgw-wenkai
        ];
      };

      # doc
      documentation = {
        dev.enable = true;
        man = { enable = true; man-db.enable = true; };
      };

      # pcscd (smart card / yubikey)
      services.pcscd.enable = true;

      # tmux
      programs.tmux = {
        enable = true;
        baseIndex = 1;
        keyMode = "vi";
      };

      # bat
      programs.bat.enable = true;

      # yazi
      programs.yazi.enable = true;
    };

    homeManager = { pkgs, config, lib, ... }: {
      # home directory
      home.homeDirectory = "/home/${config.home.username}";

      # packages
      home.packages = with pkgs; [ bottom ];

      # bat
      programs.bat.enable = true;

      # eza
      programs.eza.enable = true;

      # yazi
      programs.yazi = {
        enable = true;
        shellWrapperName = "y";
        settings.mgr.show_hidden = true;
      };

      # tealdeer
      programs.tealdeer = {
        enable = true;
        settings.updates.auto_update = true;
      };

      # git
      programs.git = {
        enable = true;
        settings = {
          alias = {
            count-lines = "! git log --author=\"$1\" --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf \"added lines: %s, removed lines: %s, total lines: %s\\n\", add, subs, loc }' #";
            lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
            la = "log --color --graph --all --branches";
          };
          init.defaultBranch = "main";
        };
      };
      programs.fish.shellAbbrs = {
        ga = "git add"; gs = "git status"; gc = "git checkout";
        gcl = "git clone"; gm = "git commit";
      };

      # fish
      programs.fish = {
        enable = true;
        shellAbbrs = {
          pb = "curl -F 'c=@-' 'https://fars.ee'";
          cargo-git = "cargo --config net.git-fetch-with-cli=true ";
        };
        functions = {
          fish_prompt = ''
            set -l last_status $status
            set -l normal (set_color normal)
            set -l usercolor (set_color $fish_color_user)
            set -l delim "> "
            string match -qi "*.utf-8" -- $LANG $LC_CTYPE $LC_ALL; or set delim "> "
            fish_is_root_user; and set delim "#"
            set -l cwd (set_color $fish_color_cwd)
            if command -sq sha256sum
              set -l shas (pwd -P | sha256sum | string sub -l 6 | string match -ra ..)
              set -l col (for f in $shas; math --base=hex "min(255, 0x$f + 0x30)"; end | string replace 0x "" | string pad -c 0 -w 2 | string join "")
              set cwd (set_color $col)
            end
            set -l prompt_status
            test $last_status -ne 0; and set prompt_status (set_color $fish_color_error)"[$last_status]$normal"
            if not set -q prompt_host
              set -g prompt_host ""
              if set -q SSH_TTY
                or begin
                  command -sq systemd-detect-virt
                  and systemd-detect-virt -q
                end
                set -l host (hostname)
                set prompt_host $usercolor$USER$normal@(set_color $fish_color_host)$host$normal":"
              end
            end
            set -l pwd (prompt_pwd)
            echo -n -s $prompt_host $cwd $pwd $normal $prompt_status $delim
          '';
          fish_right_prompt = ''
            set -g __fish_git_prompt_showdirtystate 1
            set -g __fish_git_prompt_showuntrackedfiles 1
            set -g __fish_git_prompt_showupstream informative
            set -g __fish_git_prompt_showcolorhints 1
            set -g __fish_git_prompt_use_informative_chars 1
            string match -qi "*.utf-8" -- $LANG $LC_CTYPE $LC_ALL
            and set -g __fish_git_prompt_char_dirtystate \U1F4a9
            set -g __fish_git_prompt_char_untrackedfiles "?"
            set -l vcs (fish_vcs_prompt 2>/dev/null)
            set -l d (set_color brgrey)(date "+%R")(set_color normal)
            set -l duration "$cmd_duration$CMD_DURATION"
            if test $duration -gt 100
              set duration (math $duration / 1000)s
            else
              set duration
            end
            set -q VIRTUAL_ENV_DISABLE_PROMPT
            or set -g VIRTUAL_ENV_DISABLE_PROMPT true
            set -q VIRTUAL_ENV
            and set -l venv (string replace -r '.*/' "" -- "$VIRTUAL_ENV")
            set_color reset
            string join " " -- $venv $duration $vcs $d
          '';
        };
        interactiveShellInit = ''
          set -g __fish_git_prompt_char_dirtystate '+'
          set -g fish_greeting
          set -g fish_key_bindings fish_vi_key_bindings
        '';
      };

      # direnv
      programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
        config = {
          global.strict_env = true;
          whitelist.prefix = [
            "${config.home.homeDirectory}/dev/nyx"
            "${config.home.homeDirectory}/dev/blog"
            "${config.home.homeDirectory}/dev/rust"
            "${config.home.homeDirectory}/dev/python"
            "${config.home.homeDirectory}/dev/cpp"
            "${config.home.homeDirectory}/dev/resume"
            "${config.home.homeDirectory}/dev/misc"
          ];
        };
      };

      # helix
      programs.helix = {
        enable = true;
        defaultEditor = true;
        settings = {
          theme = "gruvbox";
          editor = {
            soft-wrap.enable = true;
            line-number = "relative";
            rulers = [ 80 ];
            lsp = {
              display-messages = true;
              display-inlay-hints = true;
            };
          };
          keys.normal = {
            space = { space = "file_picker"; w = ":w"; q = ":q"; };
            esc = [ "collapse_selection" "keep_primary_selection" ];
            ret = "goto_word";
          };
        };
        ignores = [
          "target" "!.gitignore" "!.gitattributes" "!.github/"
          "!.gitlab/" "!.cargo/" "!.clang-*"
        ];
        languages = {
          language = [
            {
              name = "python";
              scope = "source.python";
              file-types = [ "py" "pyi" "py3" "pyw" ".pythonstartup" ".pythonrc" ];
              shebangs = [ "python" ];
              roots = [ "." "pyproject.toml" "pyrightconfig.json" ];
              comment-token = "#";
              language-servers = [ "pyright" "ruff" ];
              indent = { tab-width = 4; unit = "    "; };
              auto-format = true;
              formatter = { command = "black"; args = [ "-" "--quiet" "--line-length=80" ]; };
            }
            { name = "nix"; auto-format = true; formatter.command = "nixfmt"; }
          ];
          language-server = {
            rust-analyzer.config = {
              checkOnSave.command = "clippy";
              inlayHints = {
                bindingModeHints.enable = true;
                closingBraceHints.minLines = 10;
                closureReturnTypeHints.enable = "with_block";
                discriminantHints.enable = "fieldless";
                lifetimeElisionHints.enable = "skip_trivial";
                typeHints.hideClosureInitialization = false;
              };
            };
            pylsp.config.pylsp.plugins = { ruff.enabled = true; black.enabled = true; };
            pyright = {
              command = "basedpyright-langserver";
              args = [ "--stdio" ];
              config = {
                reportMissingTypeStubs = false;
                python.analysis = { typeCheckingMode = "basic"; autoImportCompletions = true; };
              };
            };
            ruff = { command = "ruff"; config.settings.args = [ ]; };
          };
        };
      };

      # fonts
      fonts.fontconfig = {
        enable = true;
        defaultFonts = {
          serif = [ "Noto Serif" "Noto Serif CJK SC" "Noto Serif CJK TC" "Noto Serif CJK JP" "Noto Serif CJK KR" ];
          sansSerif = [ "Noto Sans" "Noto Sans CJK SC" "Noto Sans CJK TC" "Noto Sans CJK JP" "Noto Sans CJK KR" ];
          monospace = [ "Noto Mono" "Sarasa Term SC" "Sarasa Term TC" "Sarasa Term J" ];
          emoji = [ "Noto Color Emoji" "Noto Emoji" ];
        };
      };

      # tmux
      programs.tmux = {
        enable = true;
        baseIndex = 1;
        keyMode = "vi";
        prefix = "C-a";
      };

      # alacritty shell config
      programs.alacritty.settings.terminal.shell = lib.mkForce "fish";
      programs.tmux.shell = lib.getExe pkgs.fish;
    };
  };
}
