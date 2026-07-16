{ den, pkgs, ... }: {
  den.aspects.alacritty = {
    nixos = {
      fonts.packages = with pkgs; [ fira-code nerd-fonts.fira-code font-awesome ];
    };
    homeManager = {
      programs.alacritty = {
        enable = true;
        settings.font.normal.family = "FiraCode Nerd Font Mono";
      };
    };
  };
}
