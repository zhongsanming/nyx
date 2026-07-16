{ den, ... }: {
  den.aspects.age-plugin-yubikey = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.age-plugin-yubikey ];
    };
  };
}
