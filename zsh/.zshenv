# Variables de entorno
if [[ -z "$EDITOR" ]]; then
    export EDITOR="nvim"
fi

if [[ -z "$LANG" ]]; then
    export LANG="es_ES.UTF-8"
fi

if [[ -z "$VISUAL" ]]; then
    export VISUAL="nvim"
fi

if [[ -z "$BROWSER" ]]; then
    export BROWSER="brave"
fi

if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='nvim'
else
    export EDITOR='nvim'
fi
