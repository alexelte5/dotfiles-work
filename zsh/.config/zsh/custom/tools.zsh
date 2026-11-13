# eza
if command -v eza >/dev/null; then
  alias ls='eza --group-directories-first'
  alias l='eza -l --group-directories-first --git'
  alias la='eza -la --group-directories-first --git'
  alias ll='la'
  alias lt='eza --tree --level=2 --group-directories-first'
fi

# zoxide
if command -v zoxide >/dev/null; then
  eval "$(zoxide init zsh)"
fi

# fzf-tab
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always --group-directories-first $realpath'