{
  den.aspects.pipewire = { host, user }:
    {
      nixos = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.wiremix
    ];
    services.pipewire = {
      enable = true;
      alsa.enable = true;
    };
  };
    };
}
