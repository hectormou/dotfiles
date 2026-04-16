# Documentation
La unica forma recomendada de desbloquear automaticamente el llavero del sistema cuando se inicia sesion es haciendo que PAM intercepte la contraseña y tambien se la pase al llavero, con display managers la tarea es muy facil pues solo es hacer lo que te dice la wiki de arch sobre el tema ( al menos con el llavero de gnome ). Para el caso particular del autologin no hay solucion posible, al no introducirse contraseña PAM no la puede interceptar nunca, por tanto, solo se puede dejar el llavero sin cifrar. En este caso particular, al forzar la pantalla de bloqueo cuando se inicia el sistema a pesar del autologin, se puede lograr que PAM si intercepte la contraseña, que logicamente ha de ser la misma que la del llavero. Se debe de añadir la siguiente linea en /etc/pam.d/hyprlock

```bash
auth optional pam_gnome_keyring.so
```

# Informacion util de conocer
* secret-tool: permite acceder a cualquier servicio que implemente la API Dbus Secret Service API
* seahorse: gui para interactuar con el llavero
* libsecret: libreria para permiir que las apps interactuen con el llavero
