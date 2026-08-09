# REST_API

Spring Boot REST API for managing `Student` entities (JPA + MySQL).

## Overview

This project is a simple Spring Boot application exposing a REST API backed by Spring Data JPA. It stores `Student` records in a MySQL database configured in `src/main/resources/application.properties`.

## Project Structure

- `src/main/java/com/example/demo/DemoApplication.java` - Spring Boot application entry point
- `src/main/java/com/example/demo/StudentController.java` - REST controller providing `/students` endpoints
- `src/main/java/com/example/demo/Student.java` - JPA entity representing a student
- `src/main/java/com/example/demo/StudentRepository.java` - Spring Data JPA repository
- `src/main/resources/application.properties` - application configuration (database, port)
- `pom.xml` - Maven build file and dependencies

## Configuration

The application is configured to run on port `8081` (see `server.port`) and connects to a MySQL database using the following defaults from `application.properties`:

- JDBC URL: `jdbc:mysql://mysql-db:3306/studentdb`
- Username: `root`
- Password: `root123`

These settings match the included `docker-compose.yml`, which defines a `mysql-db` service.

## API Endpoints

### GET /students

Returns a JSON array of `Student` objects. Each object has `id` and `name` fields.

Example response:

```json
[ { "id": 1, "name": "John Doe" }, { "id": 2, "name": "Jane Smith" } ]
```

### POST /students

Creates a new `Student`. The endpoint expects a JSON body with a `name` property and returns the persisted `Student` (including generated `id`).

Request example:

```json
{ "name": "John Doe" }
```

Response example:

```json
{ "id": 1, "name": "John Doe" }
```

## Requirements

- Java 17 or later
- Maven (wrapper included)
- Docker & Docker Compose (optional, recommended for running MySQL locally)

## Build and Run (Local)

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

The application listens on port `8081` by default.

## Run with Docker Compose

The repository includes a `docker-compose.yml` that starts a MySQL container and the Spring Boot app. To run both services:

```bash
docker-compose up --build
```

This exposes the app on `http://localhost:8081` and the MySQL server on `3306`.

## Example Requests

Retrieve all students:

```bash
curl http://localhost:8081/students
```

Add a student:

```bash
curl -X POST http://localhost:8081/students -H "Content-Type: application/json" -d '{"name":"John Doe"}'
```

## Notes

- Data is persisted to MySQL (not in-memory). The database and credentials are configured in `application.properties` and `docker-compose.yml`.
- The project uses Spring Boot `3.5.14`, `spring-boot-starter-web`, and `spring-boot-starter-data-jpa`.

## Next Steps / Improvements

- Add input validation and error handling for the controller
- Add integration tests that run against a testcontainer or H2
- Provide environment variable overrides for database configuration
- Add endpoints for update/delete and pagination
