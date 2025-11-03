{...}:
{
  programs.kitty = {
    enable = true;
    themeFile = "tokyo_night_night";
    keybindings = {
      "ctrl+equal" = "change_font_size all +2.0";
      "ctrl+minus" = "change_font_size all -2.0";
    };
  };
}
