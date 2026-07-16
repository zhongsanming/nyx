{ den, ... }: {
  den.aspects.yt-dlp = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.yt-dlp ];
    };
  };
}
