# den + flake-parts setup.
# Imports flakeModules for disko and vaultix.
# Declares systems and perSystem dev shell.
{ inputs, lib, ... }:
{
  imports = [
    inputs.disko.flakeModules.disko
    inputs.vaultix.flakeModules.default
  ];

  systems = [
    "aarch64-linux"
    "x86_64-linux"
  ];

  perSystem =
    { pkgs, ... }:
    {
      formatter = pkgs.nixfmt;
      devShells.default = pkgs.mkShell {
        buildInputs = [
          pkgs.nil
          pkgs.nixd
          pkgs.nixfmt
        ];
      };
    };
}
