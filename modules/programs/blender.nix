{
  den.aspects.blender = { host, user }:
    {
      homeManager = { pkgs, ... }:
    {
      home.packages = [
        pkgs.blender
      ];
    };
    };
}
