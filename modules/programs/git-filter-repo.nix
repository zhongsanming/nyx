{
  den.aspects.git-filter-repo = { host, user }:
    {
      nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.git-filter-repo
      ];
    };
    };
}
