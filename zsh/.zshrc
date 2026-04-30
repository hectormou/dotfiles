# Estandar XDG Personales
export XDG_PICTURES_DIR="$HOME/capturas"

# Path to your Oh My Zsh installation.
export ZSH="$ZDOTDIR/oh-my-zsh"

# Tema seleccionado
ZSH_THEME=""

# Carpeta donde incluir plugins y configuraciones custom de oh-my-zsh
ZSH_CUSTOM=$ZSH/custom

# Lista de plugins añadidos
plugins=(zsh-autosuggestions zsh-syntax-highlighting)
# docker docker-compose

# Carga de la configuracion
source $ZSH/oh-my-zsh.sh
source $ZDOTDIR/alias.zsh

# Gestion de cache
export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh/oh-my-zsh"

# Gestion de compdumb
export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/compdump/zcompdump-$HOST-$ZSH_VERSION"

# Configurar el historial
export HISTFILE="$ZDOTDIR/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS

# Variables de entorno Starship
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml" 
export STARSHIP_CACHE="$XDG_CACHE_HOME/starship/session_${STARSHIP_SESSION_KEY}.log"

# Cargar Starship
eval "$(starship init zsh)"

# Lanzamiento automatico de Hyprland
if [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec start-hyprland
fi
