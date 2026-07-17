{
  den.aspects.jq = { host, user }:
    {
      nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.jq
      ];
    };
    };
}
