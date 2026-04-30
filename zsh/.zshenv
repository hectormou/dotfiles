# Cuando se carga cualquier shell #1

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

# Variables de entorno OS_KEYRING
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export DOTNET_CLI_HOME="$XDG_DATA_HOME/dotnet"

# Variables de entorno de Rust
source "$XDG_DATA_HOME/rust/cargo/env"
export CARGO_HOME="$XDG_DATA_HOME/rust/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rust/rustup"
