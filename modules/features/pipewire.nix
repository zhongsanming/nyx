{ den, pkgs, ... }: {
  den.aspects.pipewire = {
    nixos = {
      environment.systemPackages = with pkgs; [ wiremix ];
      services.pipewire = { enable = true; alsa.enable = true; };
    };
  };
}
