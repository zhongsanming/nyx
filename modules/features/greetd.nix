{ den, ... }: {
  den.aspects.greetd = {
    nixos = {
      services.greetd.enable = true;
      programs.regreet.enable = true;
    };
  };
}
