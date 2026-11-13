# Flux Completion
command -v flux >/dev/null && source <(flux completion zsh)

# fzf-tab: Tab-Menü durch fzf ersetzen
zstyle ':completion:*' menu no
zstyle ':fzf-tab:*' use-fzf-default-opts yes   # deine Indigo-Farben aus FZF_DEFAULT_OPTS
