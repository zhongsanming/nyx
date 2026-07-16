{ den, ... }: {
  den.aspects.doc = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [ man-pages man-pages-posix ];
      documentation = {
        dev.enable = true;
        man = { enable = true; man-db.enable = true; };
      };
    };
  };
  den.aspects."tags-doc" = { includes = [ den.aspects.doc ]; };
}
