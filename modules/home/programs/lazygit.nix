{ ... }:
{
  programs.lazygit = {
    enable = true;
    settings = {
      git.commit.signOff = true;
      git.overrideGpg = true;
      os.editPreset = "nvim";
    };
  };
}
