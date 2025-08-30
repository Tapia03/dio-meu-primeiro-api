# Etapa 1: Build
FROM eclipse-temurin:17-jdk as build

# Definindo diretório de trabalho
WORKDIR /app

# Copiando arquivos do projeto para dentro do container
COPY . /app

# Garantindo que o mvnw tenha permissão de execução
RUN chmod +x mvnw

# Build do projeto com Maven Wrapper
RUN ./mvnw clean package -DskipTests

# Etapa 2: Criar imagem final
FROM eclipse-temurin:17-jdk

# Diretório da aplicação
WORKDIR /app

# Copiando o jar gerado na etapa de build
COPY --from=build /app/target/*.jar app.jar

# Porta que o Spring Boot irá expor
EXPOSE 8080

# Comando para rodar a aplicação
ENTRYPOINT ["java", "-jar", "app.jar"]
