{
  den.aspects.tealdeer = { host, user }:
    {
      nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.tealdeer
      ];
    };
      homeManager = {
    programs.tealdeer = {
      enable = true;
      settings.updates.auto_update = true;
    };
  };
    };
}
