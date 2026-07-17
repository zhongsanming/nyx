{
  den.aspects.regreet = { host, user }:
    {
      nixos = {
    imports = with self.modules.nixos; [
      greetd
    ];
    programs.regreet.enable = true;
  };
    };
}
