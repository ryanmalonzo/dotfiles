# ❄️ Nix Dotfiles (Darwin)

A declarative macOS system configuration using Nix Darwin and Home Manager.

## Features

- **System Configuration**: macOS system settings, security, and defaults
- **Application Management**: Homebrew integration for GUI applications
- **Development Environment**: Shell configuration, development tools, and programming languages
- **Dotfiles Management**: Centralized configuration for CLI tools and applications
- **Profile Support**: Easily add new profiles for different machines

## Prerequisites

1. Install macOS dependencies

```shell
xcode-select --install
```

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Install Determinate Nix using the [Determinate Nix Installer](https://github.com/DeterminateSystems/nix-installer)

```shell
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
sh -s -- install
```

> [!IMPORTANT]  
> When prompted, choose to install **Determinate Nix**, not the regular Nix.

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
sudo nix run nix-darwin -- switch --flake .
```

Or specify a specific profile with:

```shell
sudo nix run nix-darwin -- switch --flake .#<profile_name>
```

> [!NOTE]  
> After the initial setup, subsequent configuration updates must be run with `sudo` privileges.

For subsequent updates:

```shell
# Update and apply configuration (requires sudo)
sudo darwin-rebuild switch --flake .#<profile_name>
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

# Update to a new Nix version (e.g., 25.05 to 25.11)
# 1. Update version numbers in flake.nix (e.g., nixos-25.05 -> nixos-25.11)
# 2. Fetch new dependency versions
nix flake update
# 3. Apply the updated configuration
sudo nix run nix-darwin -- switch --flake .#<profile_name>
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

## Adding a profile

1. Add an entry to the `profiles` attrset in `flake.nix`:

```nix
work = {
  username = "your.username";
  homeDirectory = "/Users/your.username";
  hostConfigPath = ./hosts/work.nix;
  homeConfigPath = ./home/work.nix;
};
```

2. Create `hosts/work.nix` for host-level overrides (packages, hostname, Homebrew casks):

```nix
{ pkgs, ... }:
{
  config = {
    networking.computerName = "your-machine-name";

    environment.systemPackages = with pkgs; [
      # profile-specific packages
    ];
  };
}
```

3. Create `home/work.nix` for home-manager overrides (username, git signing key):

```nix
{ ... }:
{
  home.username = "your.username";
  home.homeDirectory = "/Users/your.username";

  imports = [
    ./common.nix
    ../programs/git/work.nix
  ];
}
```

4. Create `programs/git/work.nix` with the SSH signing key for that machine:

```nix
{ ... }:
{
  imports = [ ./common.nix ];

  programs.git.signing.key = "/Users/your.username/.ssh/git.pub";
}
```

5. Apply:

```shell
sudo darwin-rebuild switch --flake .#work
```

## Acknowledgements

- [dustinlyons/nixos-config](https://github.com/dustinlyons/nixos-config)
- [chfanghr/dotfiles](https://github.com/chfanghr/dotfiles)
- [ALT-F4-LLC/kickstart.nix](https://github.com/ALT-F4-LLC/kickstart.nix)
