{ den, ... }: {
  den.aspects.zathura = {
    homeManager = { pkgs, ... }: {
  programs.zathura.enable = true;
    };
  };
}
