# Etapa 1: Build
FROM openjdk:21-jdk-slim AS build

WORKDIR /app

RUN apt-get update && apt-get install -y git curl unzip && rm -rf /var/lib/apt/lists/*

COPY . .

RUN chmod +x mvnw
RUN ./mvnw clean package -DskipTests

# Etapa 2: Imagem final
FROM openjdk:21-jdk-slim

WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","app.jar"]
