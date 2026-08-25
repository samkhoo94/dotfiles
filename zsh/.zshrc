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
    selected_item=$(echo -e ".zshrc\n$venvs" | fzf)

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
    dir=$(fd . --type d --max-depth 2 --min-depth 2 ~/programming/ | fzf)
    [[ -n "$dir" ]] && cd "$dir"
}

unalias vv 2>/dev/null
vv() {
    if [[ -z "$HERDR_PANE_ID" ]]; then
        echo "vv: not inside a herdr pane" >&2
        return 1
    fi
    local base="$HERDR_PANE_ID" claude_pane bottom_left
    claude_pane=$(herdr pane split --pane "$base" --direction right --ratio 0.60 --no-focus | jq -r '.result.pane.pane_id')
    bottom_left=$(herdr pane split --pane "$base" --direction down --ratio 0.70 --no-focus | jq -r '.result.pane.pane_id')
    herdr pane run "$base" nvim
    herdr pane run "$claude_pane" claude
}

unalias hw 2>/dev/null
hw() {
    if ! herdr status server 2>/dev/null | grep -q "^status: running$"; then
        herdr server >/dev/null 2>&1 &
        disown
        sleep 1
    fi
    herdr workspace create --label dagster --no-focus
    herdr workspace create --label infra --no-focus
    herdr workspace create --label omni --no-focus
    herdr workspace create --label wiz --no-focus
}

unalias hsw 2>/dev/null
hsw() {
    local folder pane_id
    folder=$(fd . --type d --max-depth 1 ~/work | fzf)
    [[ -n "$folder" ]] || return
    if ! herdr status server 2>/dev/null | grep -q "^status: running$"; then
        herdr server >/dev/null 2>&1 &
        disown
        sleep 1
    fi
    pane_id=$(herdr workspace create --cwd "$folder" --label "$(basename "$folder")" | jq -r '.result.root_pane.pane_id')
    [[ -n "$pane_id" ]] && herdr pane run "$pane_id" nvim
}

# ─── Aliases: Editor ──────────────────────────────────────────────────────────

alias v="nvim"

# alias vv='tmux split-window -v -p 25 \; split-window -h -p 35 -t 1 \; send-keys -t 1 "nvim" Enter \; send-keys -t 2 "claude" Enter \; select-pane -t 1'

alias vw='cdw && nvim'
alias vz='nvim ~/.zshrc'
alias nvim-kickstart="NVIM_APPNAME=KickstartNvim nvim"
alias nvim-personal="NVIM_APPNAME=nvim-personal nvim"

# ─── Aliases: Tmux ────────────────────────────────────────────────────────────

# alias t="tmux"
# alias tn="tmux new -s"
# alias ta="tmux attach"
# alias tas="tmux attach-session -t"
# alias tk="tmux kill-server"
# alias tw="tmux new-session -d -s dagster && tmux new-session -d -s infra && tmux new-session -d -s omni && tmux new-session -d -s wiz"
# alias tsw='folder=$(fd . --type d --max-depth 1 ~/work | fzf) && tmux new-session -d -s "$(basename "$folder")" "cd \"$folder\" && nvim" && tmux attach-session -t "$(basename "$folder")"'

# ─── Aliases: Herdr ───────────────────────────────────────────────────────────

alias h="herdr"
alias hn="herdr --session"
alias ha="herdr"
alias has="herdr session attach"

# ─── Aliases: Navigation ──────────────────────────────────────────────────────

alias ll="eza --color=always --long --icons=always"
alias l="eza --color=always --long --icons=always --all"
alias dots="cd ~/dotfiles/"
alias ss="source .venv/bin/activate"
alias dt='fd --type f . ~/Downloads | fzf --multi | xargs -I {} mv {} "$HOME/programming/work/datasets/"'

# ─── Aliases: Git ─────────────────────────────────────────────────────────────
alias lz="lazygit"

# ─── Aliases: Claude ──────────────────────────────────────────────────────────
alias cl="claude"

# ─── Aliases: Misc ────────────────────────────────────────────────────────────
alias weather="curl wttr.in/Edinburgh"

# ─── FZF & Zoxide ─────────────────────────────────────────────────────────────

source <(fzf --zsh)
eval "$(zoxide init zsh)"

# ─── Prompt ───────────────────────────────────────────────────────────────────

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
