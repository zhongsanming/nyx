{ den, ... }: {
  den.aspects.zathura = {
    homeManager = { pkgs, ... }: {
  programs.zathura.enable = true;
    };
  };
  den.aspects."tags-zathura" = { includes = [ den.aspects.zathura ]; };
}
