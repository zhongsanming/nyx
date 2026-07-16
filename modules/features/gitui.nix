{ den, ... }: {
  den.aspects.gitui = {
    nixos = { pkgs, ... }: { environment.systemPackages = [ pkgs.gitui ]; };
    homeManager = { programs.gitui.enable = true; };
  };
  den.aspects."tags-gitui" = { includes = [ den.aspects.gitui ]; };
}
