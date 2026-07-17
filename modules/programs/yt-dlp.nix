{
  den.aspects.yt-dlp = { host, user }:
    {
      nixos = { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.yt-dlp
      ];
    };
    };
}
