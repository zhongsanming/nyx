{ den, ... }: {
  den.aspects.git-filter-repo = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.git-filter-repo ];
    };
  };
  den.aspects."tags-git-filter-repo" = { includes = [ den.aspects.git-filter-repo ]; };
}
