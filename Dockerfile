# Usa un'immagine Linux con Java 17 già installato
FROM eclipse-temurin:17-jre-alpine

# Crea la cartella di lavoro
WORKDIR /app

# Scarica l'ultima versione stabile di Velocity
RUN apk add --no-cache wget && \
    wget https://papermc.io -O velocity.jar

# Esponi la porta pubblica di Minecraft
EXPOSE 25565

# Comando per avviare Velocity con memoria ottimizzata per il piano free
CMD ["java", "-Xms256M", "-Xmx450M", "-jar", "velocity.jar"]
