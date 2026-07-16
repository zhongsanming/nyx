{ lib, den, ... }: {
  den.default.nixos.system.stateVersion = "25.11";
  den.default.homeManager.home.stateVersion = "25.11";

  # enable home-manager by default
  den.schema.user.classes = lib.mkDefault [ "homeManager" ];
}
