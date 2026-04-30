# Historial de paquetes añadidos

## Instalados
* hyprland pipewire (importante la escala del monitor)
* kitty
* nvim
* dbus-broker
* xdg-desktop-portal-hyprland xdg-desktop-portal-gtk (file picker para descargar cosas del navegador)
* nautilus gnome-keyring libsecret seahorse
* hyprland-qt-support qt5-wayland qt6-wayland
* fastfetch
* base-devel rust (kit de herramientas para crear software)
* yay
* brave-browser visual-studio-code-bin (ambas basadas en chromium o electron) (suelen crear el .pki)
* nerd-fonts otf-font-awesome noto-fonts-emoji (fuentes y emojis)
* blueman (acordarse de activar el bluetooth nada mas iniciar el equipo, /etc/bluetooth/main.conf Autoenable = true)
* brightnessctl (para regular el brillo de la pantalla)
* waybar
* sddm
* wofi
* hyprshot (agrega slum y grim como dependencias)
* swaync (libnotify ya se encontraba instalado, se podria investigar mas en el tema)
* hyprpolkitagent  (sustituye a hyprplokitkdeagent)
* hyprlock
* hypridle
* hyprpaper
* starship
* docker
* jdk-openjdk

## No Instalados
* uwsm (encapsular la sesión de wayland)
* hyprpwcenter (es solo para pipewire, tratar de combinarlo con waybar, pwcenter despliega una barra para gestionar temas como el volumen)
* java-openjdk-wakefield (implementacion nativa de JDK para Wayland)

## Plugins de zsh
zsh-autosuggestions zsh-syntax-highlighting

## Docker
Por comodidad, se ha añadido el usuario al grupo docker para permitir usar la utilidad sin estar elevando todo el tiempo a sudo.
