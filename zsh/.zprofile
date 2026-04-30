# Cuando se cargan shells de login #2

# Lanzamiento automatico de Hyprland
if [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec start-hyprland
fi
