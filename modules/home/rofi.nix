{ config, pkgs, ... }:
{
  programs.rofi = {
      enable = true;
      plugins = [pkgs.rofi-emoji];
  };
  # Main config
  home.file."${config.xdg.configHome}/rofi/config.rasi".text = ''
    configuration {
      modes: [drun,window,windowcd];
      case-sensitive: false;
      cycle: true;
      filter: "";
      scroll-method: 0;
      normalize-match: true;
      show-icons: true;
      icon-theme: "Papirus";
      steal-focus: false;

      run,drun {
        fallback-icon: "application-x-addon";
      }

      display-drun: "󰍉";
      display-emoji: "😳";
      display-windowcd: "";
      matching: "normal";
      fixed-num-lines: true;

      kb-remove-char-forward: "Delete";
      kb-remove-char-back: "BackSpace";
      kb-remove-to-eol: "";
      kb-remove-to-sol: "";
      kb-accept-entry: "Return,KP_Enter";
      kb-mode-complete: "";
      kb-row-left: "Control+h,Control+u";
      kb-row-right: "Control+l,Control+d";
      kb-row-up: "Control+k,Up";
      kb-row-down: "Control+j,Down";
      kb-row-tab: "Tab";
      kb-move-word-back: "";
      kb-element-next: "";

      timeout {
        action: "kb-cancel";
        delay: 0;
      }
    }

    @theme "theme"
  '';

  # Colors:
  home.file."${config.xdg.configHome}/rofi/colors.rasi".text = ''
    *{
        background-color: transparent;
        border: #5099ff;
        search:  #88cc22;
        text-unselected: #c0caf5;
        text-selected: #7aa2f7;

        button-selected: @text-selected;
        background: #1a1b26;
        button-unselected-background: #2a2a45;
        button-foreground:     #FFFFFFFF;
        transparent: rgba(0,0,0,0);
        font: "Lexend Deca 10";
    }
  '';

  # Theme:
  home.file."${config.xdg.configHome}/rofi/theme.rasi".text = ''
    @import "colors.rasi"

    window {
        location: center;
        anchor:   center;
        transparency: "real";
        padding: 10px;
        background-color: @background;
        spacing: 0;
        children:  [mainbox];
        orientation: horizontal;
        border: 1px 1px 1px 1px;
        border-color: @border;
        width: 30%;
    }

    mainbox {
        spacing: 0;
        children: [ inputbar, listview ];
    }

    inputbar {
        color: @search;
        padding: 11px 11px 1px 11px;
        background-color: @background;
        font: "Lexend Deca 10";
    }
    entry,prompt {
        text-font: inherit;
        text-color:inherit;
    }

    prompt {
        padding: 0px 6px 0px 5px;
    }

    listview {
        padding: 8px;
        background-color: @background;
        lines: 10;
    }

    element {
        padding: 3px;
        background-color: transparent;
        color: @text-unselected;
        font:inherit;
    }
    element-text {
        background-color: inherit;
        text-color:       inherit;
        padding: 0px 0px 0px 3px;
    }
    element selected.normal {
        text-color: @text-selected;
        background-color: transparent;
    }

    error-message {
        expand: true;
        background-color: red;
        border-color: darkred;
        border: 1px;
        padding: 1em;
    }
  '';
}
