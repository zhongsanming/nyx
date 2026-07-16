{ den, lib, pkgs, ... }: {
  den.aspects.fish = {
    nixos = {
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
    };
    homeManager = { pkgs, config, lib, ... }: {
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
      programs.alacritty.settings.terminal.shell = lib.mkForce "fish";
      programs.tmux.shell = lib.getExe pkgs.fish;
    };
  };
}
