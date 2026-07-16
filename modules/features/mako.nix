{ den, ... }: {
  den.aspects.mako = {
    homeManager = { services.mako.enable = true; };
  };
  den.aspects."tags-mako" = { includes = [ den.aspects.mako ]; };
}
