# Minimal profile: core system settings and services.
{ den }:
{
  den.aspects.minimal = {
    includes = [
      den.aspects.home-manager
      den.aspects.constants
      den.aspects.envvars
      den.aspects.firewall
      den.aspects.root
      den.aspects.sudo
      den.aspects.users
      den.aspects.ssh
    ];

    nixos = {
      i18n.defaultLocale = "en_US.UTF-8";
    };

    homeManager =
      { config, ... }:
      {
        home.homeDirectory = "/home/${config.home.username}";
        programs.home-manager.enable = true;
      };
  };
}
