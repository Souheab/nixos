{...}:
{
  programs.fish.enable = true;

  programs.fish.interactiveShellInit = ''
  set -g fish_key_bindings fish_vi_key_bindings
  bind \cR history-search
  '';

  programs.fish.shellAbbrs = {
    lg  = "lazygit";
    nrb = "sudo nixos-rebuild switch --flake ~/Documents/nixos/#nixo";
    nlg = "lazygit -p ~/Documents/nixos";
    ncd = "cd ~/Documents/nixos";
  };
}
