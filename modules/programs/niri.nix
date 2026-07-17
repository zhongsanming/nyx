{
  den.aspects.niri = { host, user }:
    {
      nixos = {
    programs = {
      uwsm = {
        waylandCompositors = {
          niri = {
            prettyName = "Niri";
            comment = "Niri compositor managed by UWSM";
            binPath = "/run/current-system/sw/bin/niri";
          };
        };
      };
      niri.enable = true;
    };
  };
      homeManager = { };
    };
}
