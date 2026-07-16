{ den, ... }: {
  den.aspects.ykman = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.yubikey-manager ];
    };
  };
}
