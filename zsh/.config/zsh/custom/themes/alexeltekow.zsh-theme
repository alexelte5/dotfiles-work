# Git (wird von git_prompt_info zusammengesetzt: PREFIX + branch + DIRTY/CLEAN + SUFFIX)
ZSH_THEME_GIT_PROMPT_PREFIX="  %F{#8b5cf6}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{#8b5cf6}%f"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{yellow}*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# kube-ps1
KUBE_PS1_SYMBOL_ENABLE=false
KUBE_PS1_PREFIX='  ['
KUBE_PS1_SUFFIX='] '
KUBE_PS1_CTX_COLOR=141
KUBE_PS1_NS_COLOR=cyan

_kube_ns() {
  [[ -z "$1" || "$1" == "N/A" ]] && echo "default" || echo "$1"
}
KUBE_PS1_NAMESPACE_FUNCTION=_kube_ns

# Zeile 1: Ordner, Git, Kube-Context
# Zeile 2: Pfeil (violett = ok, rot = Fehler)
PROMPT='%B%F{#6366f1}%1~%f%b$(git_prompt_info)$(kube_ps1)
%B%(?.%F{#8b5cf6}.%F{red})❯%f%b '

RPROMPT=$'%{\e[1A%}%F{8}$(_weather) %T%f%{\e[1B%}'