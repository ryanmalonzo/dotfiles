# ❄️ Nix Dotfiles (Darwin)

A declarative macOS system configuration using Nix Darwin and Home Manager.

## Features

- **System Configuration**: macOS system settings, security, and defaults
- **Application Management**: Homebrew integration for GUI applications
- **Development Environment**: Shell configuration, development tools, and programming languages
- **Dotfiles Management**: Centralized configuration for CLI tools and applications
- **Multi-Host Support**: Separate configurations for personal and work machines

## Prerequisites

1. Install macOS dependencies

```shell
xcode-select --install
```

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Install Nix using the [Determinate Nix Installer](https://github.com/DeterminateSystems/nix-installer)

```shell
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
sh -s -- install
```

> [!IMPORTANT]  
> When prompted, choose to install regular Nix (from NixOS), **NOT** Determinate Nix.

Then start a new shell session for `nix` to become available in `$PATH`.

## Usage

1. Clone this repository

```shell
git clone https://github.com/ryanmalonzo/dotfiles ~/dotfiles && \
cd ~/dotfiles
```

2. Apply the configuration

For the first time setup:

```shell
nix run nix-darwin -- switch --flake .
```

Or specify a specific profile with:

```shell
nix run nix-darwin -- switch --flake .#<profile_name>
```

> [!NOTE]  
> After the initial setup, subsequent configuration updates must be run with `sudo` privileges.

For subsequent updates:

```shell
# Update and apply configuration (requires sudo)
sudo darwin-rebuild switch --flake .
```

## Common tasks

```shell
# Delete old generations
nix-collect-garbage -d

# Update all flake inputs
nix flake update

# Update specific input
nix flake lock --update-input nixpkgs
nix flake lock --update-input home-manager
```

## Troubleshooting

### Permission Issues

If you encounter permission errors during cleanup operations (like uninstalling applications), you may need to:

1. Enable **Full Disk Access** for your terminal application
2. Go to **System Settings** → **Privacy & Security** → **Full Disk Access**
3. Add your terminal application (Terminal.app, iTerm2, etc.)

### Environment Variables

After applying configuration changes, you may need to:
- Restart your terminal application, or
- Run `source ~/.zshrc` to reload environment variables

Some changes (like npm configuration) may require a new shell session to take effect.

## Acknowledgements

- [dustinlyons/nixos-config](https://github.com/dustinlyons/nixos-config)
- [chfanghr/dotfiles](https://github.com/chfanghr/dotfiles)
- [ALT-F4-LLC/kickstart.nix](https://github.com/ALT-F4-LLC/kickstart.nix)
- [Customizing Firefox with Nix and Home Manager](https://hugosum.com/blog/customizing-firefox-with-nix-and-home-manager)
