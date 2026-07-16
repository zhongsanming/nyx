{ inputs, lib, den, ... }: {
  den.aspects.nix-opinionated = {
    nixos = {
      nix.settings.flake-registry = "";
      nix.nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") (lib.filterAttrs (_: v: lib.isType "flake" v) inputs);
    };
  };
}
