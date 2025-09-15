function ls --wraps='eza --color=always --icons=always --long --git --no-user --no-time' --wraps='eza --color=always --icons=always --long --git --no-user --tree --level 1 --header' --wraps='eza --color=always --icons=always --long --git --no-user --tree --level 2 --header' --wraps='eza --color=always --icons=always --long --git --no-user --tree --level 1 --header --group-directories-first' --description 'alias ls=eza --color=always --icons=always --long --git --no-user --tree --level 1 --header --group-directories-first'
  eza --color=always --icons=always --long --git --no-user --tree --level 1 --header --group-directories-first $argv
        
end
