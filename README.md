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

2. Build the configuration

```shell
nix build .#darwinConfigurations.Ryans-MacBook-Air.system
```

3. Apply changes to the system

```shell
./result/sw/bin/darwin-rebuild switch --flake .
```

## Acknowledgements

TBA
