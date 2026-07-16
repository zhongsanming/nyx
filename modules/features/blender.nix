{ den, ... }: {
  den.aspects.blender = {
    homeManager = { pkgs, ... }: {
  home.packages = [ pkgs.blender ];
    };
  };
  den.aspects."tags-blender" = { includes = [ den.aspects.blender ]; };
}
