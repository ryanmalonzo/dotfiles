{ ... }:
{
  programs.lazygit = {
    enable = true;
    settings = {
      git.commit.signOff = true;
      git.overrideGpg = true;
      git.pull.mode = "rebase";
      os.editPreset = "nvim";
    };
  };
}
