{
  den.aspects.envvars = { host, user }:
    {
      nixos = {
    # this should fix some issue caused by environment variable
    # differences between system and user programs
    # although we still have other envvar to add like fcitx5-related ones
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
  };
      homeManager = {
    home.sessionVariables.NIXOS_OZONE_WL = "1";
  };
    };
}
