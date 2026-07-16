{ den, ... }: {
  den.aspects.swayimg = {
    homeManager = { pkgs, ... }: {
  programs.swayimg.enable = true;
    };
  };
  den.aspects."tags-swayimg" = { includes = [ den.aspects.swayimg ]; };
}
