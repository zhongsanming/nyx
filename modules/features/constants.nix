{ den, ... }: {
  den.aspects.constants = {
    nixos = { constants.efiMountpoint = "/boot/efi"; };
  };
  den.aspects."tags-constants" = { includes = [ den.aspects.constants ]; };
}
