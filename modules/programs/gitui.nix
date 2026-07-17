{
  den.aspects.gitui = { host, user }:
    {
      nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.gitui
      ];
    };
      homeManager = {
    programs.gitui = {
      enable = true;
    };
  };
    };
}
