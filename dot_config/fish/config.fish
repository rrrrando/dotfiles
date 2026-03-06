set fish_greeting

# Check if we're in an interactive shell
if status is-interactive

    # At this point, specify the Zellij config dir, so we can launch it manually if we want to
    export ZELLIJ_CONFIG_DIR=$HOME/.config/zellij

    # Check if our Terminal emulator is Ghostty
    if [ "$TERM" = "xterm-ghostty" ]
        # Launch zellij
        eval (zellij setup --generate-auto-start fish | string collect)
    end
end

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

