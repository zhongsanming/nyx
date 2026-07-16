{ den, ... }: {
  den.aspects.age-plugin-yubikey = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.age-plugin-yubikey ];
    };
  };
  den.aspects."tags-age-plugin-yubikey" = { includes = [ den.aspects.age-plugin-yubikey ]; };
}
