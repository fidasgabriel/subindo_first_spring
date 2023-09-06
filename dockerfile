#BUILD
FROM maven:3.8.3-openjdk-17 AS BUILD

COPY . .
RUN mvn clean package -DskipTests

# Stage Package
FROM openjdk:17-jdk-slim

COPY --from=BUILD /target/FirstSpring-0.0.1-SNAPSHOT.jar fidas.jar

EXPOSE 8080
ENTRYPOINT [ "java", "-jar", "fidas.jar" ]
