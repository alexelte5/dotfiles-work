# dotfiles-work

zsh + oh-my-zsh Setup mit eigenem Theme, Kube-Context im Prompt, fzf (History + Tab-Completion), Autosuggestions, eza und zoxide.

## Installation

    git clone <repo-url> ~/dotfiles-work
    ~/dotfiles-work/install.sh

kubectl, flux und kubectx/kubens werden vorausgesetzt.

## Was drin ist

| Befehl | Funktion |
|---|---|
| `Ctrl+R` | History durchsuchen (fzf) |
| `<TAB>` | Completion mit fzf, auch für Pods/Namespaces |
| `→` | Grauen Autosuggestion-Vorschlag übernehmen |
| `z <teil>` / `zi` | Zu besuchtem Ordner springen |
| `ls`, `la`, `lt` | eza-Listen / Baum |

## WSL-Tipps

**Langsame Tab-Completion:** WSL hängt den Windows-PATH an, das bremst. In `/etc/wsl.conf`:

    [interop]
    appendWindowsPath = false

Dann in PowerShell `wsl --shutdown`. VS Code danach über `~/.zshrc.local` wieder
in den PATH holen (Vorlage: `zshrc.local.example`).

**`Input/output error` bei `code` oder `/mnt/c`:** In PowerShell `wsl --shutdown`, Terminal neu öffnen.

## Eigene Anpassungen

Persönliches (Pfade, Tokens) in `~/.zshrc.local`, wird automatisch geladen und nicht committed.
