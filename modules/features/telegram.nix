{ den, ... }: {
  den.aspects.telegram = {
    homeManager = { pkgs, ... }: {
  home.packages = [ pkgs.telegram-desktop ];
    };
  };
  den.aspects."tags-telegram" = { includes = [ den.aspects.telegram ]; };
}
