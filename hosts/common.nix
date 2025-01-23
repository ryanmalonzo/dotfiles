{ pkgs, ... }: {
  # Nix configuration
  nix = {
    optimise.automatic = true;
    settings = {
      experimental-features = "nix-command flakes";
      warn-dirty = false;
      trusted-users = [ "@admin" ];
    };
    gc = {
      automatic = true;
      interval.Day = 7;
    };
  };

  environment.systemPackages = with pkgs; [
    neovim
    coreutils
    curl
    wget
  ];
} 