# Basic profile: CLI tools and dev-oriented packages.
{ den }:
{
  den.aspects.basic = {
    includes = [
      den.aspects.minimal

      # programs
      den.aspects.age-plugin-yubikey
      den.aspects.bat
      den.aspects.bottom
      den.aspects.btrfs
      den.aspects.choose
      den.aspects.comma
      den.aspects.compsize
      den.aspects.difftastic
      den.aspects.direnv
      den.aspects.duf
      den.aspects.dufs
      den.aspects.eza
      den.aspects.fd
      den.aspects.fish
      den.aspects.git
      den.aspects.git-filter-repo
      den.aspects.gitui
      den.aspects.gh
      den.aspects.grex
      den.aspects.helix
      den.aspects.hexyl
      den.aspects.hgrep
      den.aspects.jid
      den.aspects.jq
      den.aspects.lsof
      den.aspects.manix
      den.aspects.ncdu
      den.aspects.nix-diff
      den.aspects.nix-du
      den.aspects.nix-index
      den.aspects.nix-melt
      den.aspects.nix-output-monitor
      den.aspects.nix-tree
      den.aspects.pfetch
      den.aspects.procs
      den.aspects.rage
      den.aspects.ripgrep
      den.aspects.tealdeer
      den.aspects.tmux
      den.aspects.tokei
      den.aspects.wget
      den.aspects.xh
      den.aspects.yazi
      den.aspects.ykman
      den.aspects.you-get
      den.aspects.yt-dlp
      den.aspects.zola

      # services
      den.aspects.pcscd

      # settings
      den.aspects.doc
      den.aspects.firmware
      den.aspects.fonts
    ];
  };
}
