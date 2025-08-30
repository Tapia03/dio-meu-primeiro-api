# Imagem base com Java 17
FROM eclipse-temurin:17-jdk-alpine

# Diretório da aplicação dentro do container
WORKDIR /app

# Copia todos os arquivos para o container
COPY . .

# Torna o mvnw executável dentro do container
RUN ["chmod", "+x", "mvnw"]

# Build do projeto, ignorando testes
RUN ./mvnw clean package -DskipTests

# Expõe a porta do Spring Boot
EXPOSE 8080

# Comando para iniciar a aplicação
CMD ["java", "-jar", "target/dio-meu-primeiro-api-0.0.1-SNAPSHOT.jar"]
