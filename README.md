# nyx

My NixOS configuration written with **den** (aspect-oriented Nix).

This config uses [den](https://github.com/denful/den) - an aspect-oriented,
context-driven Nix framework. Features are organized as composable **aspects**
rather than per-host piles of modules.

## Structure

- `modules/dendritic.nix` - Inputs and flake-parts/den integration
- `modules/hosts.nix` - Host and user definitions
- `modules/defaults.nix` - Shared defaults (stateVersion, etc.)
- `modules/aspects/` - Profile chain: minimal → basic → desktop → laptop
- `modules/nyx.nix` - Host "nyx" specific config (hardware, hostname, boot, disko)
- `modules/serephus.nix` - User "serephus" config (account, git, ssh keys)
- `modules/vaultix.nix` - Vaultix flake-level config
- `modules/v2ray.nix` - V2Ray client aspect
  - `modules/system/settings/vaultix/` - Encrypted secrets (age files)
- `modules/templates/` - Project templates (rust, python, etc.)

## Profile hierarchy

```
minimal → basic → desktop → laptop
```

- **minimal**: nix settings, users, firewall, i18n, sudo, env vars
- **basic**: git, fish, helix, fonts, direnv, tmux, bat, yazi, docs, pcscd
- **desktop**: pipewire, hyprland, niri, waybar, fcitx5, qutebrowser, hyprlock, mako
- **laptop**: bluetooth, wireless, libinput, v2ray

## Usage

```bash
# Build and switch
sudo nixos-rebuild switch --flake .

# Or with nh
nh os switch .
```
