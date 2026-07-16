# Exposes flake apps under the name of each host for building with nh.
{ den, lib, inputs, ... }: {
  perSystem = { pkgs, ... }: {
    packages = den.lib.nh.denPackages { fromFlake = true; } pkgs;
  };
}
