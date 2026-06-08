# dotfiles

nix-darwin + home-manager.

## Bootstrap

```sh
# 1. Xcode command-line tools
xcode-select --install

# 2. Determinate Nix
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

# 3. Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 4. Clone
git clone https://github.com/ryanmalonzo/dotfiles ~/dotfiles
cd ~/dotfiles

# 5. Restore age key from vault into ~/.config/sops/age/keys.txt

# 6. First activation
sudo nix run nix-darwin/nix-darwin-26.05#darwin-rebuild -- switch --flake .#<profile>
```

After the first switch, use `sudo darwin-rebuild switch --flake .#<profile>` instead.

## Secrets

Encrypted with [sops-nix](https://github.com/Mic92/sops-nix).

To edit secrets (after first switch, `SOPS_AGE_KEY_FILE` is set automatically):

```sh
sops secrets/common.yaml
```

## Commands

```sh
sudo darwin-rebuild switch --flake .#personal  # or .#work
nix flake check
nix fmt
```
