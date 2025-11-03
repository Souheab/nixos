{...}:
{
  programs.wezterm.enable = true;
  programs.wezterm.extraConfig = ''
    local config = {}
    if wezterm.config_builder then
    	config = wezterm.config_builder()
    end

    config.color_scheme = "Tokyo Night (Gogh)"

    config.hide_tab_bar_if_only_one_tab = true
    config.adjust_window_size_when_changing_font_size = false

    config.window_padding = {
      left = 5,
      right =  0,
      top = 0,
      bottom = 0,
    }

    return config
  '';
}
