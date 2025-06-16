{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

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
    cargo
    coreutils
    curl
    glow
    go
    neovim
    prettierd
    protobuf
    protoc-gen-go
    protoc-gen-go-grpc
    tealdeer
    terraform
    wget
  ];
}
