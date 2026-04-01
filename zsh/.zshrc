# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ─── Exports ──────────────────────────────────────────────────────────────────

export ZSH="$HOME/.oh-my-zsh"
export EDITOR='nvim'
export PYENV_ROOT="$HOME/.pyenv"

# ─── Oh My Zsh ────────────────────────────────────────────────────────────────

ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:update' mode reminder
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Installed via: brew install zsh-autosuggestions zsh-syntax-highlighting
[[ -f $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && \
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -f $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && \
    source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ─── Environment ──────────────────────────────────────────────────────────────

source ~/.zshrc_env

# ─── Pyenv ────────────────────────────────────────────────────────────────────

command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# ─── Functions ────────────────────────────────────────────────────────────────

# Fuzzy-select a virtualenv from ~/env/ or reload .zshrc
so() {
    local venvs selected_item
    venvs=$(fd . --type d --max-depth 1 "$HOME/env/")
    selected_item=$(echo -e ".zshrc\n$venvs" | fzf-tmux -p)

    if [ "$selected_item" = ".zshrc" ]; then
        source ~/.zshrc
        echo "Sourced .zshrc file."
    elif [ -n "$selected_item" ]; then
        source "$selected_item/bin/activate"
        echo "Activated virtual environment: $selected_item"
    else
        echo "No virtual environment or .zshrc selected."
    fi
}

# Fuzzy-select a project directory under ~/programming/
unalias cdw 2>/dev/null
cdw() {
    local dir
    dir=$(fd . --type d --max-depth 2 --min-depth 2 ~/programming/ | fzf-tmux -p)
    [[ -n "$dir" ]] && cd "$dir"
}

# ─── Aliases: Editor ──────────────────────────────────────────────────────────

alias v="nvim"
alias vv="fd --type f --hidden --exclude .git | fzf-tmux -p | xargs nvim"
alias vw='cdw && nvim'
alias vz='nvim ~/.zshrc'
alias nvim-kickstart="NVIM_APPNAME=KickstartNvim nvim"

# ─── Aliases: Tmux ────────────────────────────────────────────────────────────

alias t="tmux"
alias tn="tmux new -s"
alias ta="tmux attach"
alias tas="tmux attach-session -t"
alias tk="tmux kill-server"
alias tw="tmux new-session -d -s dagster && tmux new-session -d -s infra && tmux new-session -d -s omni && tmux new-session -d -s wiz"
alias tsw='folder=$(fd . --type d --max-depth 1 ~/work | fzf) && tmux new-session -d -s "$(basename "$folder")" "cd \"$folder\" && nvim" && tmux attach-session -t "$(basename "$folder")"'

# ─── Aliases: Navigation ──────────────────────────────────────────────────────

alias ll="eza --color=always --long --icons=always"
alias l="eza --color=always --long --icons=always --all"
alias dots="cd ~/dotfiles/"
alias ss="source .venv/bin/activate"
alias dt='fd --type f . ~/Downloads | fzf-tmux --multi -p | xargs -I {} mv {} "$HOME/programming/work/datasets/"'

# ─── FZF & Zoxide ─────────────────────────────────────────────────────────────

source <(fzf --zsh)
eval "$(zoxide init zsh)"

# ─── Prompt ───────────────────────────────────────────────────────────────────

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
