# Starship custom prompt
starship init fish | source

# Direnv + Zoxide
command -v direnv &> /dev/null && direnv hook fish | source
command -v zoxide &> /dev/null && zoxide init fish --cmd cd | source

set -gx EDITOR nvim
set -gx VISUAL nvim
# set -gx PATH $PATH /usr/share/archcraft/scripts/

# Better ls
alias ls='eza --icons --group-directories-first -1'

# # Helpful aliases
alias c='clear'
alias l='eza -lh --icons=auto'                                         # long list
alias ls='eza -1 --icons=auto'                                         # short list
alias cl='clear;eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto'                                       # long list dirs
alias lt='eza --icons=auto --tree'                                     # list folder as tree
alias fastfetch='fastfetch --logo-type kitty'
alias f='fastfetch'
alias cf='clear;fastfetch'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push origin main'

if set -q XDG_SESSION_DESKTOP && string match -q "Hyprland" "$XDG_SESSION_DESKTOP"
        if test -f ~/.local/state/caelestia/sequences.txt
            printf (cat ~/.local/state/caelestia/sequences.txt 2>/dev/null)
    end
end

# cat ~/.local/state/caelestia/sequences.txt 2> /dev/null

# For jumping between prompts in foot terminal
function mark_prompt_start --on-event fish_prompt
    echo -en "\e]133;A\e\\"
end

# pokego --no-title --random 1-7
alias nvimc='NVIM_APPNAME=nvchad nvim'

alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
