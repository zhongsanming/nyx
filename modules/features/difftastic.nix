{ den, ... }: {
  den.aspects.difftastic = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.difftastic ];
    };
  };
}
