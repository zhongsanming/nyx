_: {
  config = {
    users.users.zsm = {
      hashedPassword = "$6$ndwtoasent$Zl1zI/r6AR9pZ8KdqtpC5QG5oZ1ihm3zYP2MHDdAXUDMMasA1KOVoGTQ6CbwZ4r19ESPfyHV5M8EaykhOsbNv/";
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "input"
        "video"
        "audio"
        "users"
        "disk"
      ];
      packages = [ ];
      uid = 1001;
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF5e3LLnKzrRWg/RHZ4gs9XVg8YVD4mU8b+vjUKzItWm zhongsanming@zetianzhihang.com"
      ];
    };
  };
}
