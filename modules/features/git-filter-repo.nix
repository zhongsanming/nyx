{ den, ... }: {
  den.aspects.git-filter-repo = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.git-filter-repo ];
    };
  };
}
