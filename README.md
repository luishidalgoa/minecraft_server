# Pasos de ejecución para el servidor Docker de Minecraft 1.21.1

1. **Clonar el repositorio**
   - Clona el repositorio que contiene las carpetas `mods`, `world`, y `resourcepacks`.
   
2. **Arrancar el servidor Docker**
   - Ejecuta el contenedor utilizando el comando `docker-compose up` para generar los archivos necesarios para el servidor por defecto. En este primer arranque, se crearán los archivos base para el servidor.

3. **Detener el contenedor**
   - Una vez que el servidor haya arrancado correctamente y generado los archivos iniciales, detén el contenedor pulsando `crt` + `D`

4. **Mover las carpetas originales**
   - descomprime los ficheros `mods`, `world`, y `resourcepacks` en el directorio actual

5. **Arrancar nuevamente el contenedor**
   - Vuelve a ejecutar el contenedor con el comando `docker-compose up -d` para que los archivos de `mods`, `world`, y `resourcepacks` sean utilizados por el servidor.

6. **Interacción con el contenedor**
   - Para interactuar con el contenedor del servidor, ejecuta el script `minecraft.sh`. Este script automáticamente ejecutará los comandos necesarios para interactuar con el contenedor y facilitar la administración del servidor de Minecraft.
