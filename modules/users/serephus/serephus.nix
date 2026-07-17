# User serephus aspect.
# Includes define-user and user-shell batteries, plus v2client for qutebrowser proxy shortcuts.
{ den, ... }:
{
  den.aspects.serephus = {
    includes = [
      den.batteries.define-user
      den.batteries.primary-user
      (den.batteries.user-shell "fish")
      den.aspects.v2client
    ];

    nixos = _: {
      users.users.serephus = {
        hashedPassword = "$y$j9T$Kd.XCW/gJoS41OmyJioSe1$MAk45.m/HFOYdo4WcIPlDz4X9ipmzgv3aWbRqIEaJ89";
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJCl8X5dDv+19y323NZkCbSMiou8phYjbTvTUou5Ju+w i@sereph.us"
        ];
      };
    };

    homeManager = {
      programs.git.settings.user = {
        name = "serephus";
        email = "i@sereph.us";
      };
    };
  };
}
