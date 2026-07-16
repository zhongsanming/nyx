{ den, ... }: {
  den.aspects.constants = {
    nixos = { constants.efiMountpoint = "/boot/efi"; };
  };
}
