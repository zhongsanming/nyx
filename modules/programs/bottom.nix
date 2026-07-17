{
  den.aspects.bottom = { host, user }:
    {
      nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.bottom
      ];
    };
      homeManager = {
    programs.bottom.enable = true;
  };
    };
}
