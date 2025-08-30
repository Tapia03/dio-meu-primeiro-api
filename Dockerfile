# Etapa 1: Build
FROM openjdk:17-jdk-slim AS build

# Diretório de trabalho
WORKDIR /app

# Copia arquivos do projeto
COPY . .

# Torna o mvnw executável e builda o projeto
RUN chmod +x mvnw
RUN ./mvnw clean package -DskipTests

# Etapa 2: Criar imagem final
FROM openjdk:17-jdk-slim

# Diretório de trabalho
WORKDIR /app

# Copia o JAR do build
COPY --from=build /app/target/*.jar app.jar

# Porta que a aplicação irá expor
EXPOSE 8080

# Comando para rodar a aplicação
ENTRYPOINT ["java","-jar","app.jar"]
