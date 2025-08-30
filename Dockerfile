# Etapa 1: Build do projeto
FROM eclipse-temurin:21-jdk AS build

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos do Maven Wrapper e configura permissões
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

RUN chmod +x mvnw

# Copia o código fonte
COPY src src

# Build do projeto, pulando os testes para acelerar
RUN ./mvnw clean package -DskipTests

# Etapa 2: Imagem final para rodar a aplicação
FROM eclipse-temurin:21-jdk

WORKDIR /app

# Copia o JAR gerado na etapa de build
COPY --from=build /app/target/dio-meu-primeiro-api-0.0.1-SNAPSHOT.jar dio-meu-primeiro-api-0.0.1-SNAPSHOT.jar

# Porta que a aplicação irá expor
EXPOSE 8080

# Comando para iniciar a aplicação
CMD ["java", "-jar", "dio-meu-primeiro-api-0.0.1-SNAPSHOT.jar"]
