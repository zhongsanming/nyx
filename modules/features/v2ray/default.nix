{ inputs, den, ... }:
let
  mkOutbound = { addr, port, uuid, protocol ? "vmess", encryption ? "chacha20-poly1305" }: {
    protocol = protocol;
    settings = {
      vnext = [{
        address = addr;
        port = port;
        users = [{ encryption = encryption; id = uuid; }];
      }];
    };
  };
in {
  den.aspects.v2ray = {
    nixos = { config, ... }: {
      vaultix = {
        secrets = {
          v2addr = { file = ./v2addr.age; };
          v2uuid = { file = ./v2uuid.age; };
        };
        templates = {
          v2client = {
            mode = "644";
            content = builtins.toJSON {
              inbounds = [
                { listen = "0.0.0.0"; port = 1080; protocol = "socks"; }
                { listen = "0.0.0.0"; port = 8080; protocol = "http"; }
              ];
              outbounds = map mkOutbound [{
                addr = config.vaultix.placeholder.v2addr;
                uuid = config.vaultix.placeholder.v2uuid;
                port = 28349;
              }];
            };
          };
        };
      };
      services.v2ray = {
        enable = true;
        configFile = config.vaultix.templates.v2client.path;
      };
    };
    homeManager = { config, ... }: {
      programs.qutebrowser.keyBindings.normal = {
        "<Ctrl-l>" = "config-cycle content.proxy socks5://localhost:1080 none";
        "zz" = "hint links spawn yt-dlp -P ${config.home.homeDirectory}/res/downloads --proxy socks5://localhost:1080 {hint-url}";
      };
    };
  };
  den.aspects."tags-v2ray" = { includes = [ den.aspects.v2ray ]; };
}
