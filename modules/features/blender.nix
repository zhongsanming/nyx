{ den, ... }: {
  den.aspects.blender = {
    homeManager = { pkgs, ... }: {
  home.packages = [ pkgs.blender ];
    };
  };
}
