FROM debian:12-slim

# Instalar dependencias necesarias
RUN apt-get update && apt-get install -y wget nano tar && rm -rf /var/lib/apt/lists/*

# Detectar la arquitectura y descargar el JDK correspondiente
RUN ARCH=$(uname -m) && \
    if [ "$ARCH" = "x86_64" ]; then \
        wget -q https://download.oracle.com/java/21/archive/jdk-21_linux-x64_bin.deb && \
        apt-get install -y --no-install-recommends ./jdk-21_linux-x64_bin.deb && \
        rm -rf jdk-21_linux-x64_bin.deb; \
    elif [ "$ARCH" = "aarch64" ]; then \
        wget -q https://download.oracle.com/java/21/archive/jdk-21_linux-aarch64_bin.tar.gz && \
        mkdir -p /usr/lib/jvm/jdk-21 && \
        tar -xzf jdk-21_linux-aarch64_bin.tar.gz --strip-components=1 -C /usr/lib/jvm/jdk-21 && \
        rm -rf jdk-21_linux-aarch64_bin.tar.gz; \
    fi

# Establecer el PATH globalmente para todas las capas
ENV PATH="/usr/lib/jvm/jdk-21/bin:$PATH"

# Definir directorio de trabajo
WORKDIR /minecraft

# Definir la URL del instalador de Forge
ARG FORGE_URL="https://maven.neoforged.net/releases/net/neoforged/neoforge/21.1.127/neoforge-21.1.127-installer.jar"

# Descargar e instalar Forge
RUN wget -q ${FORGE_URL} -O forge-installer.jar && \
    java -jar forge-installer.jar --installServer && \
    rm forge-installer.jar

# Aceptar la EULA de Minecraft
RUN echo "eula=true" > eula.txt

# Crear carpetas necesarias
RUN mkdir -p /minecraft/mods /minecraft/world

# Exponer el puerto del servidor de Minecraft
EXPOSE 25565

# Comando de inicio: ejecutar el servidor de Minecraft
CMD ["/minecraft/run.sh"]
