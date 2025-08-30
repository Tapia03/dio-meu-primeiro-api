# Etapa 1: build do projeto
FROM eclipse-temurin:21-jdk AS build

WORKDIR /app

# Copia Maven Wrapper e dá permissão de execução
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
RUN chmod +x mvnw

# Copia o código fonte
COPY src src

# Build do projeto, gerando o JAR
RUN ./mvnw clean package -DskipTests

# Etapa 2: imagem final
FROM eclipse-temurin:21-jdk

WORKDIR /app

# Copia apenas o JAR gerado na etapa de build
COPY --from=build /app/target/dio-meu-primeiro-api-0.0.1-SNAPSHOT.jar dio-meu-primeiro-api-0.0.1-SNAPSHOT.jar

# Porta da aplicação
EXPOSE 8080

# Comando para rodar a aplicação
CMD ["java", "-jar", "dio-meu-primeiro-api-0.0.1-SNAPSHOT.jar"]
