# Usa un'immagine ufficiale Linux con Java 25 (OpenJDK 25)
FROM eclipse-temurin:25-jre-alpine

# Imposta la cartella principale dentro il server
WORKDIR /app

# Scarica l'ultima build stabile di Velocity (supporta Java 25)
RUN apk add --no-cache wget && \
    wget https://papermc.io -O velocity.jar

# Apre la porta di Minecraft verso l'esterno
EXPOSE 25565

# Avvia Velocity limitando la memoria per il piano gratuito di Render (512MB)
CMD ["java", "-Xms256M", "-Xmx400M", "-jar", "velocity.jar"]
