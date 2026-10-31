FROM eclipse-temurin:17-jdk-jammy

WORKDIR /data

RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*

# Enlace actualizado para la versión 1.20.4 de Minecraft Java
RUN wget -O server.jar https://piston-data.mojang.com/v1/objects/0f38b598d6dd29759d54e4f20387550f757f516c/server.jar

RUN echo "eula=true" > eula.txt

EXPOSE 25565/tcp
EXPOSE 25565/udp

CMD ["java", "-Xmx1G", "-Xms1G", "-jar", "server.jar", "nogui"]
