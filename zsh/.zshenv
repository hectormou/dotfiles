# Cuando se carga cualquier shell #1

# Variables de entorno
if [[ -z "$EDITOR" ]]; then
    export EDITOR="nvim"
fi

if [[ -z "$VISUAL" ]]; then
    export VISUAL="nvim"
fi

if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='nvim'
else
    export EDITOR='nvim'
fi
