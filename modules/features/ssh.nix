{ den, ... }: {
  den.aspects.ssh = {
    nixos = {
      services.openssh = {
        enable = true;
        openFirewall = true;
        allowSFTP = true;
        settings = {
          PasswordAuthentication = false;
          PermitRootLogin = "no";
        };
      };
    };
    homeManager = {
      programs.ssh = {
        enable = true;
        enableDefaultConfig = false;
        settings = {
          router = {
            hostname = "192.168.8.1";
            user = "root";
            hostKeyAlgorithms = "ssh-rsa";
            fingerprintHash = "md5";
          };
          gh = { hostname = "github.com"; user = "git"; };
          gl = { hostname = "gitlab.com"; user = "git"; };
        };
      };
      programs.git.settings.url = {
        "git@github.com:".insteadOf = [ "gh:" "github:" "https://github.com" ];
        "git@gitlab.com:".insteadOf = [ "gl:" "gitlab:" "https://gitlab.com" ];
      };
    };
  };
  den.aspects."tags-ssh" = { includes = [ den.aspects.ssh ]; };
}
