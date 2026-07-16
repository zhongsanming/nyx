# User "serephus" aspect: user account, git config, ssh keys
{ den, lib, inputs, ... }:
let
  username = "serephus";
in {
  den.aspects."${username}" = {
    includes = [
      den.batteries.define-user
      den.batteries.primary-user
    ];

    nixos = {
      users.users."${username}" = {
        hashedPassword = "$y$j9T$Kd.XCW/gJoS41OmyJioSe1$MAk45.m/HFOYdo4WcIPlDz4X9ipmzgv3aWbRqIEaJ89";
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJCl8X5dDv+19y323NZkCbSMiou8phYjbTvTUou5Ju+w i@sereph.us"
        ];
      };
    };

    homeManager = {
      home.username = "${username}";
      programs.git.settings.user = {
        name = "${username}";
        email = "i@sereph.us";
      };
    };
  };
}
