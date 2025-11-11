set fish_greeting

set -gx ATUIN_NOBIND "true"
atuin init fish | source

bind up _atuin_bind_up
bind \cr _atuin_search

#ENV VARS
set -gx EDITOR "nvim"
set -gx HOMEBREW_NO_ENV_HINTS 1
set -gx XDG_CONFIG_HOME "$HOME/.config"

starship init fish | source
zoxide init fish | source
mise activate fish | source

