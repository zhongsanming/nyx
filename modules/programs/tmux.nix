{
  den.aspects.tmux = { host, user }:
    {
      nixos = {
    programs.tmux = {
      enable = true;
      baseIndex = 1;
      keyMode = "vi";
    };
  };
      homeManager = {
    programs.tmux = {
      enable = true;
      baseIndex = 1;
      keyMode = "vi";
      prefix = "C-a";
    };
  };
    };
}
