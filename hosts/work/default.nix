_: {
  imports = [
    ./disko.nix
    ./hardware.nix

    ../vmware
  ];

  time.timeZone = "Asia/Shanghai";
  networking.hostName = "zsm";

  # state version, never change this
  system.stateVersion = "25.05";
}
