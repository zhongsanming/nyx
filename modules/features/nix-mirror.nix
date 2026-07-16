{ den, ... }: {
  den.aspects.nix-mirror = {
    nixos = {
      nix.settings.substituters = [ "https://mirrors.ustc.edu.cn/nix-channels/store" ];
      nix.settings.trusted-substituters = [ "https://mirrors.ustc.edu.cn/nix-channels/store" ];
    };
  };
}
