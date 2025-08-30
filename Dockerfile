# Use uma imagem base do Java
FROM eclipse-temurin:17-jdk-alpine

# Diretório da aplicação dentro do container
WORKDIR /app

# Copia todos os arquivos do projeto para o container
COPY . /app

# Garante que o mvnw seja executável
RUN chmod +x mvnw

# Build do projeto
RUN ./mvnw clean package -DskipTests

# Expõe a porta que o Spring Boot vai rodar
EXPOSE 8080

# Comando para rodar a aplicação
CMD ["java", "-jar", "target/dio-meu-primeiro-api-0.0.1-SNAPSHOT.jar"]
