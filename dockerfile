# Stage de compilação
FROM maven:3.8.3-openjdk-17 AS BUILD

WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline

COPY src/ ./src/
RUN mvn package -DskipTests -X

# Stage de pacote
FROM openjdk:17-jdk-slim

COPY --from=BUILD /app/target/FirstSpring-0.0.1-SNAPSHOT.jar fidas.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "fidas.jar"]
