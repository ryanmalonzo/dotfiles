# My personal dotfiles for MacOS development

## Prerequisites

1. Install OS dependencies

```shell
xcode-select --install
```

2. Install Nix using the [Determinate Nix Installer](https://github.com/DeterminateSystems/nix-installer)

```shell
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
sh -s -- install
```

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

For subsequent updates:
```shell
# Update and apply configuration
darwin-rebuild switch --flake .
```

## Common Tasks

```shell
# Delete old generations
nix-collect-garbage -d

# Update all flake inputs
nix flake update

# Update specific input
nix flake lock --update-input nixpkgs
nix flake lock --update-input home-manager
```

## Acknowledgements

TBA
