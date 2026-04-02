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

/Users/rando/.local/bin/mise activate fish | source # added by https://mise.run/fish

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
