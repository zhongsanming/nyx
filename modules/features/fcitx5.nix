{ den, pkgs, ... }: {
  den.aspects.fcitx5 = {
    nixos = {
      i18n.inputMethod = {
        enable = true;
        type = "fcitx5";
        fcitx5 = {
          addons = with pkgs; [
            fcitx5-gtk qt6Packages.fcitx5-chinese-addons
            fcitx5-pinyin-zhwiki fcitx5-tokyonight libsForQt5.fcitx5-qt
          ];
          waylandFrontend = true;
          settings = {
            globalOptions = { };
            inputMethod = {
              "Groups/0" = { "Name" = "Default"; "Default Layout" = "us"; "DefaultIM" = "shuangpin"; };
              "Groups/0/Items/0" = { "Name" = "keyboard-us"; "Layout" = ""; };
              "Groups/0/Items/1" = { "Name" = "shuangpin"; "Layout" = ""; };
              "GroupOrder" = { "0" = "Default"; };
            };
            addons.pinyin = {
              globalSection = { ShuangpinProfile = "Custom"; ShuangpinMode = true; PageSize = 7; };
              sections = { };
            };
          };
        };
      };

      xdg.configFile = {
        "fcitx5/pinyin/sp.dat".source = (pkgs.formats.ini { }).generate "sp.dat" {
          "fengAn"."fengAnMingCheng" = "custom";
          "lingShengMuBiaoShi"."''" = "O";
          "shengMu" = { ch = "I"; sh = "U"; zh = "V"; };
          "yunMu" = {
            ai = "D"; an = "N"; ang = "Y"; ao = "C";
            ei = "W"; en = "T"; eng = "G"; er = "R";
            ia = "X"; ian = "M"; iang = "L"; iao = "B";
            ie = "H"; "in" = "P"; ing = "F"; iong = "S";
            iu = "Q"; ong = "S"; ou = "Z";
            ua = "X"; uai = "F"; uan = "R"; uang = "L";
            ue = "K"; ui = "V"; un = "J"; uo = "O";
          };
        };
        "fcitx5".recursive = true;
      };

    };
  };
  den.aspects."tags-fcitx5" = { includes = [ den.aspects.fcitx5 ]; };
}
