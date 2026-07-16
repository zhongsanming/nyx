{ den, ... }: {
  den.aspects.mpv = {
    homeManager = { pkgs, ... }: {
  programs.mpv.enable = true;
    };
  };
}
