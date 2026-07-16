{ den, lib, ... }: {
  den.aspects.git = {
    nixos = {
      programs.git = { enable = true; config.init.defaultBranch = "main"; };
      programs.fish.shellAbbrs = {
        ga = "git add"; gs = "git status"; gc = "git checkout";
        gcl = "git clone"; gm = "git commit";
      };
    };
    homeManager = { pkgs, config, ... }: {
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
      programs.helix.settings.keys.normal.space.i = lib.mkForce ":sh git blame -L %{cursor_line},%{cursor_line} %{buffer_name}";
    };
  };
  den.aspects."tags-git" = { includes = [ den.aspects.git ]; };
}
