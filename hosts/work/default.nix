_: {
  imports = [
    ./disko.nix
    ./hardware.nix

    ../vmware
  ];

  networking.hosts = {
    "192.168.2.188" = [ "git.ztzh.com" ];
  };

  time.timeZone = "Asia/Shanghai";
  networking.hostName = "zsm";

  # state version, never change this
  system.stateVersion = "25.05";
}
