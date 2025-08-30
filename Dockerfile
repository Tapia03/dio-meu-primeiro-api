# Etapa de build
FROM eclipse-temurin:21-jdk AS build

# Diretório da aplicação dentro do container
WORKDIR /app

# Copiar mvnw e pasta .mvn
COPY mvnw ./
COPY .mvn .mvn

# Copiar pom.xml e src
COPY pom.xml ./
COPY src ./src

# Dar permissão para mvnw
RUN chmod +x mvnw

# Build da aplicação (gera o jar em /app/target/)
RUN ./mvnw clean package -DskipTests

# Etapa de runtime
FROM eclipse-temurin:21-jdk

WORKDIR /app

# Copiar jar da etapa de build
COPY --from=build /app/target/dio-meu-primeiro-api-0.0.1-SNAPSHOT.jar app.jar

# Porta que o Spring Boot vai usar
EXPOSE 8080

# Comando para rodar a aplicação
ENTRYPOINT ["java","-jar","app.jar"]
