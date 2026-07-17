{
  den.aspects.root = { host, user }:
    {
      nixos = {
    # default root password
    users.users.root.hashedPassword = "$y$j9T$vmrHUvAuXfmw23ZWlTAFy0$pl4hBYuUzxYPoo7Z3IAPloJ.AZN0jZDeIKgmY/qspf0";
  };
    };
}
