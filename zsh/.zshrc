# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


############### USER CONFIGUATION ###################
# FOR NEW INSTALL TO FIX CLOCK ISSUE
# timedatectl set-local-rtc 1 --adjust-system-clock

# THEMING
ZSH_THEME="powerlevel10k/powerlevel10k"


# UPDATES & PLUGINS
zstyle ':omz:update' mode reminder
plugins=(git)
source $ZSH/oh-my-zsh.sh

# PYENV
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Function to source
# 1. Python virtual environments
# 2. ZSH
so() {
    # Get list of virtual environments
    venvs=$(fd . --type d --max-depth 1 "$HOME/env/")

    # Use fzf to select virtual environment or .zshrc
    selected_item=$(echo -e ".zshrc\n$venvs" | fzf-tmux -p )

    # If .zshrc is selected, source the file
    if [ "$selected_item" = ".zshrc" ]; then
        source ~/.zshrc
        echo "Sourced .zshrc file."
    elif [ -n "$selected_item" ]; then
        # Activate selected virtual environment
        source "$selected_item/bin/activate"
        echo "Activated virtual environment: $selected_item"
    else
        echo "No virtual environment or .zshrc selected."
    fi
}

##### ALIASES #####
# TMUX
alias v="nvim"
alias vv="fd --type f --hidden --exclude .git | fzf-tmux -p | xargs nvim"
alias vw='programming_dir=$(fd . --type d --max-depth 2 --min-depth 2 ~/programming/ | fzf-tmux -p) && cd $programming_dir && nvim'  # FZF work directories and open neovim
alias t="tmux"
alias tn="tmux new -s"
alias ta="tmux attach"
alias tas="tmux attach-session -t"
alias tsw='folder=$(fd . --type d --max-depth 1 ~/work | fzf) && tmux new-session -d -s "$(basename "$folder")" "cd \"$folder\" && nvim" && tmux attach-session -t "$(basename "$folder")"'
#NEOVIM
alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias nvim-kickstart="NVIM_APPNAME=Kickstart nvim"
# EZA ( NICE LS )
alias ll="eza --color=always --long --icons=always"
alias l="eza --color=always --long --icons=always --all"
# DOTFILES
alias dots="cd ~/dotfiles/"

export EDITOR='nvim'

alias cdw='programming_dir=$(fd . --type d --max-depth 2 --min-depth 2 ~/programming/ | fzf-tmux -p) && cd $programming_dir'  # FZF work directories

##### END ALIASES #####


#################### END USER CONFIGUATION #####################

# FZF
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
