{ den, ... }: {
  den.aspects.tealdeer = {
    nixos = { pkgs, ... }: { environment.systemPackages = [ pkgs.tealdeer ]; };
    homeManager = { programs.tealdeer = { enable = true; settings.updates.auto_update = true; }; };
  };
  den.aspects."tags-tealdeer" = { includes = [ den.aspects.tealdeer ]; };
}
