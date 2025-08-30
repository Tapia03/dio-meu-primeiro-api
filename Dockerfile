# ===============================
# Etapa de build
# ===============================
FROM eclipse-temurin:21-jdk AS build

# Copia arquivos do Maven Wrapper
COPY .mvn .mvn
COPY mvnw .

# Define o diretório de trabalho
WORKDIR /app

# Copia pom.xml e código fonte
COPY pom.xml .
COPY src src/

# Dá permissão para o mvnw
RUN chmod +x mvnw

# Build da aplicação (gera o jar em /app/target/)
RUN ./mvnw clean package -DskipTests

# ===============================
# Etapa de runtime
# ===============================
FROM eclipse-temurin:21-jdk

WORKDIR /app

# Copia o jar da etapa de build
COPY --from=build /app/target/app.jar .

# Expondo a porta do Spring Boot
EXPOSE 8080

# Comando para rodar a aplicação
CMD ["java", "-jar", "app.jar"]
