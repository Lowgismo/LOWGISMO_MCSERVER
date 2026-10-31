FROM eclipse-temurin:17-jdk-jammy

WORKDIR /data

RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*

RUN wget -O server.jar https://piston-data.mojang.com/v1/objects/4707d00eb834b4fc641ecc8bc2af3ed1c69b593b/server.jar

RUN echo "eula=true" > eula.txt

EXPOSE 25565/tcp
EXPOSE 25565/udp

CMD ["java", "-Xmx1G", "-Xms1G", "-jar", "server.jar", "nogui"]
