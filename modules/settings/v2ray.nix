# v2ray: vaultix-based config with vmess outbound.
{ den, ... }:
{
  den.aspects.v2ray = {
    includes = [ den.aspects.vaultix ];

    nixos =
      { config, ... }:
      {
        vaultix =
          let
            mkOutbound =
              {
                addr,
                port,
                uuid,
                protocol ? "vmess",
                encryption ? "chacha20-poly1305",
              }:
              {
                protocol = protocol;
                settings = {
                  vnext = [
                    {
                      address = addr;
                      port = port;
                      users = [
                        {
                          encryption = encryption;
                          id = uuid;
                        }
                      ];
                    }
                  ];
                };
              };
          in
          {
            secrets = {
              v2addr = {
                file = ./vaultix/v2addr.age;
              };
              v2uuid = {
                file = ./vaultix/v2uuid.age;
              };
            };
            templates = {
              v2client = {
                mode = "644";
                content = builtins.toJSON {
                  inbounds = [
                    {
                      listen = "0.0.0.0";
                      port = 1080;
                      protocol = "socks";
                    }
                    {
                      listen = "0.0.0.0";
                      port = 8080;
                      protocol = "http";
                    }
                  ];
                  outbounds = map mkOutbound [
                    {
                      addr = config.vaultix.placeholder.v2addr;
                      uuid = config.vaultix.placeholder.v2uuid;
                      port = 28349;
                    }
                  ];
                };
              };
            };
          };
      };
  };
}
