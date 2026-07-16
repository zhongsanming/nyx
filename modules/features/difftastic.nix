{ den, ... }: {
  den.aspects.difftastic = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.difftastic ];
    };
  };
  den.aspects."tags-difftastic" = { includes = [ den.aspects.difftastic ]; };
}
