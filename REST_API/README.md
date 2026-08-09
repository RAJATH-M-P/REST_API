# Student REST API

A Spring Boot REST API that manages `Student` entities using Spring Data JPA and MySQL.

**Tech stack:** Spring Boot 3.5.14, Spring Web, Spring Data JPA, MySQL. Java 17.

**Project files:**
- [DemoApplication.java](src/main/java/com/example/demo/DemoApplication.java)
- [StudentController.java](src/main/java/com/example/demo/StudentController.java)
- [Student.java](src/main/java/com/example/demo/Student.java)
- [StudentRepository.java](src/main/java/com/example/demo/StudentRepository.java)
- [application.properties](src/main/resources/application.properties)
- [pom.xml](pom.xml)

## Overview

The API exposes endpoints to list and create students. Student is a JPA entity with fields `id` (Long) and `name` (String).

By default the application is configured to connect to a MySQL database (see `application.properties`) and runs on port `8081`.

## Requirements

- Java 17
- Maven (wrapper included)
- Docker (optional, for running MySQL via docker-compose)

## Build and run (local, using Maven)

From the project root:

```bash
./mvnw clean package
./mvnw spring-boot:run
```

On Windows PowerShell:

```powershell
./mvnw.cmd clean package
./mvnw.cmd spring-boot:run
```

The app will start on port `8081` (configured in `src/main/resources/application.properties`).

## Run with Docker Compose (recommended for local testing)

Docker Compose will start a MySQL container and the application. From the project root:

```bash
docker compose up --build
```

The compose file defines two services: `mysql-db` (MySQL 8.0) and `student-app`.

Database credentials are set in `application.properties` and the compose file:

- URL: `jdbc:mysql://mysql-db:3306/studentdb`
- Username: `root`
- Password: `root123`

## API

All endpoints are rooted at `/students`.

### GET /students

Returns a JSON array of `Student` objects (each with `id` and `name`). Example:

```json
[{"id":1,"name":"John Doe"}]
```

### POST /students

Create a new student by sending a JSON body with a `name` field. Example request:

```bash
curl -X POST http://localhost:8081/students \
	-H "Content-Type: application/json" \
	-d '{"name":"Alice"}'
```

Response: the saved `Student` object with generated `id`.

## Configuration

See [application.properties](src/main/resources/application.properties) for current settings (server port, datasource URL, JPA options).

## Notes

- The project uses Spring Data JPA (`StudentRepository extends JpaRepository<Student,Long>`).
- The database schema is created/updated automatically via `spring.jpa.hibernate.ddl-auto=update`.

## Next steps / Improvements

- Add validation and DTOs for request/response shapes
- Add integration tests and CI
- Support environment-specific configuration (profiles)
