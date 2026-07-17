# Default settings for all hosts and home-manager users.
{ lib, den, ... }:
{
  den.default.nixos.system.stateVersion = "25.11";
  den.default.homeManager.home.stateVersion = "25.11";
  den.schema.user.classes = lib.mkDefault [ "homeManager" ];
}
