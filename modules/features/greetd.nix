{ den, ... }: {
  den.aspects.greetd = {
    nixos = {
      services.greetd.enable = true;
      programs.regreet.enable = true;
    };
  };
  den.aspects."tags-greetd" = { includes = [ den.aspects.greetd ]; };
}
