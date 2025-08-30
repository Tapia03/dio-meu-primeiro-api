# Etapa 1: Build
FROM eclipse-temurin:21-jdk AS build
WORKDIR /app

# Copia arquivos e torna mvnw executável
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
COPY src src
RUN chmod +x mvnw
RUN ./mvnw clean package -DskipTests

# Etapa 2: Imagem final
FROM eclipse-temurin:21-jdk
WORKDIR /app

# Copia o JAR gerado na etapa de build
COPY --from=build /app/target/dio-meu-primeiro-api-0.0.1-SNAPSHOT.jar app.jar

# Expõe a porta que o Spring Boot roda
EXPOSE 8080

# Comando para rodar a aplicação
ENTRYPOINT ["java", "-jar", "app.jar"]
