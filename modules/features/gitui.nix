{ den, ... }: {
  den.aspects.gitui = {
    nixos = { pkgs, ... }: { environment.systemPackages = [ pkgs.gitui ]; };
    homeManager = { programs.gitui.enable = true; };
  };
}
