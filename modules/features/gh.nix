{ den, ... }: {
  den.aspects.gh = {
    homeManager = { pkgs, ... }: {
  programs.gh.enable = true;
    };
  };
}
