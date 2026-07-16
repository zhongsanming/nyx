{ den, ... }: {
  den.aspects.mpv = {
    homeManager = { pkgs, ... }: {
  programs.mpv.enable = true;
    };
  };
  den.aspects."tags-mpv" = { includes = [ den.aspects.mpv ]; };
}
