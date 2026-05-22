# dotfiles

nix-darwin + home-manager.

## Bootstrap

```sh
# 1. Xcode command-line tools
xcode-select --install

# 2. Determinate Nix
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

# 3. Clone
git clone https://github.com/ryanmalonzo/dotfiles ~/dotfiles
cd ~/dotfiles

# 4. Restore age key from vault into ~/.config/sops/age/keys.txt

# 5. First activation
nix run nix-darwin/nix-darwin-25.11 -- switch --flake .#personal
```

After the first switch, `darwin-rebuild switch --flake .#personal` works normally.

## Secrets

Encrypted with [sops-nix](https://github.com/Mic92/sops-nix).

To edit secrets (after first switch, `SOPS_AGE_KEY_FILE` is set automatically):
```sh
sops secrets/personal.yaml
```

## Commands

```sh
sudo darwin-rebuild switch --flake .#personal
nix flake check
nix fmt
```
