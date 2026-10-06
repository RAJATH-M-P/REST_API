<<<<<<< HEAD
# Stage 1: Build
FROM maven:3.9-eclipse-temurin-17 AS build

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

# Stage 2: Run
=======
>>>>>>> e49a2be218bc9ea152bfb0baac163996370cd3f3
FROM eclipse-temurin:17

WORKDIR /app

<<<<<<< HEAD
COPY --from=build /app/target/*.jar app.jar
=======
COPY target/demo-0.0.1-SNAPSHOT.jar app.jar
>>>>>>> e49a2be218bc9ea152bfb0baac163996370cd3f3

ENTRYPOINT ["java","-jar","app.jar"]