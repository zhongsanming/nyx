{ den, ... }: {
  den.aspects.obs = {
    homeManager = { pkgs, ... }: {
  programs.obs-studio.enable = true;
    };
  };
}
