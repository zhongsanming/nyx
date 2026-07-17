# Vaultix: enables vaultix nixos module + userborn service.
{ inputs }:
{
  den.aspects.vaultix = {
    nixos = {
      imports = [ inputs.vaultix.nixosModules.default ];
      services.userborn.enable = true;
    };
  };
}
