{
  den.aspects.constants = { host, user }:
    {
      nixos = { lib, ... }:
    {
      options.constants = lib.mkOption {
        type = lib.types.attrsOf lib.types.unspecified;
        default = { };
      };

      config.constants = {
        efiMountpoint = "/boot/efi";
      };
    };
    };
}
