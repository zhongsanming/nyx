{
  den.aspects.bat = { host, user }:
    {
      nixos = {
    programs.bat = {
      enable = true;
    };
  };
      homeManager = {
    programs.bat = {
      enable = true;
    };
  };
    };
}
