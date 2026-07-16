{ den, ... }: {
  den.aspects.gh = {
    homeManager = { pkgs, ... }: {
  programs.gh.enable = true;
    };
  };
  den.aspects."tags-gh" = { includes = [ den.aspects.gh ]; };
}
