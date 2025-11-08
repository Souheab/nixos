{...}:
{
  programs.fish.enable = true;

  programs.fish.interactiveShellInit = ''
  set -g fish_key_bindings fish_vi_key_bindings
  set fish_greeting
  bind -M insert \cr fish_fzf_reverse_search
  bind -M insert \cs spotify_player

  function fish_fzf_reverse_search
    set -l cmd (history search --max=1000 | fzf --height 40% --reverse --prompt 'History> ')
    if test -n "$cmd"
      commandline -f cancel
      commandline -- $cmd
    end
  end
  '';

  programs.fish.shellAbbrs = {
    lg  = "lazygit";
    nrb = "sudo nixos-rebuild switch --flake ~/Documents/nixos/#lancestrom";
    nlg = "lazygit -p ~/Documents/nixos";
    ncd = "cd ~/Documents/nixos";
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };
}
