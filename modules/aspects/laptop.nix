{ den, ... }: {
  den.aspects.laptop = {
    includes = [ den.aspects.desktop den.aspects.v2ray ];

    nixos = { pkgs, lib, ... }: {
      # bluetooth
      hardware.bluetooth = { enable = true; powerOnBoot = true; };
      services.blueman.enable = true;

      # wireless
      networking.wireless.enable = true;

      # wifi config
      networking.wireless.networks."glwifi-5g" = {
        pskRaw = "622d17f9b063286b5324a7e777da9b6f6a46d3aeb7fc64053aae89c98a7cc810";
        priority = 1000;
      };

      # libinput
      services.libinput.enable = true;
    };
  };
}
