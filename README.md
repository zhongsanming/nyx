# nyx

My NixOS configuration written with **den** (aspect-oriented Nix).

This config uses [den](https://github.com/denful/den) - an aspect-oriented,
context-driven Nix framework. Features are organized as composable **aspects**
rather than per-host piles of modules or inherited profiles.

## Structure

- `modules/dendritic.nix` - Inputs and flake-parts/den integration
- `modules/hosts.nix` - Host and user definitions
- `modules/defaults.nix` - Shared defaults (stateVersion, etc.)
- `modules/features/` - **46 standalone feature aspects**, flat by composition
- `modules/nyx.nix` - Host "nyx" composes its features explicitly
- `modules/serephus.nix` - User "serephus" config (account, git, ssh keys)
- `modules/vaultix.nix` - Vaultix flake-level config
- `modules/system/settings/vaultix/` - Encrypted secrets (age files)
- `modules/templates/` - Project templates (rust, python, etc.)

## Design: Composition over inheritance

Each feature is a standalone `den.aspects.<name>` with no implicit dependency chain.
The host explicitly lists every feature it wants:

```nix
den.aspects.nyx = {
  includes = [
    den.aspects.fish    # shell
    den.aspects.git     # version control
    den.aspects.helix   # editor
    den.aspects.hyprland  # compositor
    den.aspects.waybar    # status bar
    # ... explicitly list what you need
  ];
};
```

No inherited profile chain (`minimal -> basic -> desktop -> laptop`).
Add a feature by adding one line; remove it by deleting that line.

## Feature index (46 total)

**Core system**: nix, nix-opinionated, nix-mirror, users, root, sudo,
firewall, i18n, envvars, constants, doc

**CLI tools**: fish, git, helix, direnv, tmux, bat, yazi, eza, bottom,
tealdeer, fd, ripgrep, jq, fonts, pcscd

**Desktop**: pipewire, uwsm, hyprland, niri, greetd, alacritty, waybar,
wpaperd, bibata, mako, chromium, fcitx5, hypridle, hyprlock, qutebrowser

**Laptop**: bluetooth, wireless, glwifi, libinput

**Services**: v2ray

## Usage

```bash
# Build and switch
sudo nixos-rebuild switch --flake .
```
