{ den, ... }: {
  den.aspects.ykman = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.yubikey-manager ];
    };
  };
  den.aspects."tags-ykman" = { includes = [ den.aspects.ykman ]; };
}
