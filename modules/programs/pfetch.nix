{
  den.aspects.pfetch = { host, user }:
    {
      nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.pfetch-rs
      ];
    };
    };
}
