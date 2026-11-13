export PATH="$(echo "$PATH" | tr ':' '\n' | grep -v 'Cloud SDK' | paste -sd:)"

export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.config/zsh/custom"
export CLOUDSDK_METADATA_PREFERENCE=none
ZSH_THEME="alexeltekow"

plugins=(
    git
    kube-ps1
    fzf
    fzf-tab
    zsh-completions
    zsh-autosuggestions
    kubectl
)
zstyle ':omz:plugins:kubectl' aliases no

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Created by `pipx` on 2026-07-29 06:50:20
export PATH="$PATH:$HOME/.local/bin"

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
