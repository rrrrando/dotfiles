set fish_greeting

set -gx ATUIN_NOBIND "true"
atuin init fish | source

bind up _atuin_bind_up
bind \cr _atuin_search

#ENV VARS
set -Ux HERD_PHP_83_INI_SCAN_DIR "$HOME/Library/Application Support/Herd/config/php/83/"
set -Ux HERD_PHP_84_INI_SCAN_DIR "$HOME/Library/Application Support/Herd/config/php/84/"
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
set -gx EDITOR "nvim"
set -gx HOMEBREW_NO_ENV_HINTS 1
set -gx XDG_CONFIG_HOME "$HOME/.config"

starship init fish | source
zoxide init fish | source
mise activate fish | source

