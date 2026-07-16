{ den, ... }: {
  den.aspects.yazi = {
    nixos = { programs.yazi.enable = true; };
    homeManager = {
      programs.yazi = { enable = true; shellWrapperName = "y"; settings.mgr.show_hidden = true; };
    };
  };
}
