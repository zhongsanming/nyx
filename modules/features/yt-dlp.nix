{ den, ... }: {
  den.aspects.yt-dlp = {
    nixos = { pkgs, ... }: {
  environment.systemPackages = [ pkgs.yt-dlp ];
    };
  };
  den.aspects."tags-yt-dlp" = { includes = [ den.aspects.yt-dlp ]; };
}
