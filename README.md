# Pasos de ejecución para el servidor Docker de Minecraft 1.21.1

1. **Clonar el repositorio**
   - Clona el repositorio que contiene las carpetas `mods`, `world`, y `resourcepacks`.
   
2. **Arrancar el servidor Docker**
   - Ejecuta el contenedor utilizando el comando `docker-compose up` para generar los archivos necesarios para el servidor por defecto. En este primer arranque, se crearán los archivos base para el servidor.

3. **Detener el contenedor**
   - Una vez que el servidor haya arrancado correctamente y generado los archivos iniciales, detén el contenedor pulsando `crt` + `D`

4. **Integrar mods , partidas guardadas y resourcepacks** 
   - Si deseas que tu servidor tenga mods, un mundo ya creado y resourcepacks puedes introducirle los datos dentro de los directorios mods, resourcepacks, world
   que se habran generado en el directorio del repositorio

6. **Interacción con el contenedor**
   - Para interactuar con el contenedor del servidor, ejecuta el script `minecraft.sh`. Este script automáticamente ejecutará los comandos necesarios para interactuar con el contenedor y facilitar la administración del servidor de Minecraft.
