{ den, lib, pkgs, ... }: {
  den.aspects.bibata = {
    homeManager = {
      home.pointerCursor = {
        gtk.enable = true;
        package = lib.mkDefault pkgs.bibata-cursors;
        name = "Bibata-Modern-Ice";
        size = 16;
      };
    };
  };
  den.aspects."tags-bibata" = { includes = [ den.aspects.bibata ]; };
}
