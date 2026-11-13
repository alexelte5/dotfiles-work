# fzf aus ~/.fzf (vom install.sh)
export PATH="$HOME/.fzf/bin:$PATH"

# Layout + Indigo-Nacht-Farben für alle fzf-Aufrufe (Ctrl+R, Tab, kubens, zi …)
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border=rounded \
  --color=fg:-1,bg:-1,gutter:-1,hl:#8b5cf6 \
  --color=fg+:#e0e7ff,bg+:#1e1b4b,hl+:#a78bfa \
  --color=info:#6b7280,prompt:#6366f1,pointer:#8b5cf6,marker:#8b5cf6,spinner:#6366f1 \
  --color=border:#6366f1,header:#6366f1"

# Nur für Ctrl+R: lange Befehle unten komplett anzeigen
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:wrap"
