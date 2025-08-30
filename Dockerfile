# Etapa de build
FROM eclipse-temurin:21-jdk AS build
WORKDIR /app

COPY mvnw ./
COPY .mvn .mvn
COPY pom.xml ./
COPY src src/

RUN chmod +x mvnw
RUN ./mvnw clean package -DskipTests

# Etapa de runtime
FROM eclipse-temurin:21-jdk
WORKDIR /app

COPY --from=build /app/target/dio-meu-primeiro-api-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","app.jar"]
