set fish_greeting

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

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
set -Ux CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense'
set -gx XDG_CONFIG_HOME "$HOME/.config"


carapace _carapace | source
starship init fish | source
zoxide init fish | source

