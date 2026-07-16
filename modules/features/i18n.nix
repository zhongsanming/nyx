{ den, ... }: {
  den.aspects.i18n = {
    nixos = { i18n.defaultLocale = "en_US.UTF-8"; };
  };
  den.aspects."tags-i18n" = { includes = [ den.aspects.i18n ]; };
}
