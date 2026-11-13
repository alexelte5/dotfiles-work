# Flux Completion
command -v flux >/dev/null && source <(flux completion zsh)

# fzf-tab: Tab-Menü durch fzf ersetzen
zstyle ':completion:*' menu no
zstyle ':fzf-tab:*' use-fzf-default-opts yes   # deine Indigo-Farben aus FZF_DEFAULT_OPTS

# fzf-tab: Platz für den Rahmen einrechnen + Mindesthöhe
zstyle ':fzf-tab:*' fzf-pad 4          # Standard ist 2, +2 für Rahmen oben/unten
zstyle ':fzf-tab:*' fzf-min-height 5   # nie kleiner als 10 Zeilen
