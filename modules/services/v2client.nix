# v2ray client: nixos service + homeManager qutebrowser proxy shortcuts.
{ den, ... }:
{
  den.aspects.v2client = {
    includes = [ den.aspects.v2ray ];

    nixos =
      { config, ... }:
      {
        services.v2ray = {
          enable = true;
          configFile = config.vaultix.templates.v2client.path;
        };
      };

    homeManager =
      { config, ... }:
      {
        programs.qutebrowser.keyBindings.normal = {
          "<Ctrl-l>" = "config-cycle content.proxy socks5://localhost:1080 none";
          "zz" = "hint links spawn yt-dlp -P ${config.home.homeDirectory}/res/downloads --proxy socks5://localhost:1080 {hint-url}";
        };
      };
  };
}
