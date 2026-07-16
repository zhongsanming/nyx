{ den, ... }: {
  den.aspects.tokei = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.tokei ];
    };
  };
  den.aspects."tags-tokei" = { includes = [ den.aspects.tokei ]; };
}
