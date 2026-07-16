# vaultix flake-level config: identities and node mappings
{ inputs, ... }: {
  flake.vaultix = {
    nodes = inputs.self.nixosConfigurations;
    identity = "./secrets/age-yubikey-identity-af10df80.txt";
  };
}
