# Student REST API

A small REST API built with Spring Boot for creating and listing students. Student records are stored in MySQL using Spring Data JPA.

## Features

- `GET /students` returns all students.
- `POST /students` creates a student and returns the saved record.
- MySQL persistence with a generated student ID.
- Docker Compose configuration for running the API and database together.

## Technology

- Java 17
- Spring Boot 3.5.14
- Spring Web
- Spring Data JPA / Hibernate
- MySQL 8
- Maven

## Run with Docker Compose

You will need Docker and the Docker Compose plugin. From the project root, run:

```bash
docker compose up --build
```

Compose builds and starts the API and MySQL, waiting for the database health check before starting the API. The API is available at `http://localhost:8081`.

To stop the services:

```bash
docker compose down
```

The database settings and development credentials are defined in `docker-compose.yml` and `src/main/resources/application.properties`. These defaults are intended for local development only; change them before using this project in a shared or production environment.

## API

### List students

```http
GET /students
```

Example:

```bash
curl http://localhost:8081/students
```

Response:

```json
[
  {
    "id": 1,
    "name": "John Doe"
  }
]
```

An empty database returns an empty array: `[]`.

### Create a student

```http
POST /students
Content-Type: application/json
```

Request:

```json
{
  "name": "John Doe"
}
```

Example:

```bash
curl -X POST http://localhost:8081/students \
  -H "Content-Type: application/json" \
  -d '{"name":"John Doe"}'
```

The response contains the saved student, including its generated `id`:

```json
{
  "id": 1,
  "name": "John Doe"
}
```

## Build

The project includes a Maven wrapper. To build the application JAR without running tests:

```bash
./mvnw clean package -DskipTests
```

On Windows PowerShell:

```powershell
.\mvnw.cmd clean package -DskipTests
```

The included Spring Boot test loads the application context and needs a reachable MySQL database using the configured datasource settings.

## Project layout

```text
src/
  main/
    java/com/example/demo/
      DemoApplication.java       # Spring Boot entry point
      Student.java               # JPA entity
      StudentController.java     # REST endpoints
      StudentRepository.java     # Spring Data JPA repository
    resources/
      application.properties     # Application and database configuration
  test/
    java/com/example/demo/
      DemoApplicationTests.java  # Application context test
Dockerfile                       # Multi-stage image build
docker-compose.yml               # API and MySQL services
pom.xml                          # Maven dependencies and build
```

## Notes

- The API listens on port `8081`.
- The `Student` entity has a generated `id` and a `name`.
- Hibernate is configured to update the database schema automatically (`spring.jpa.hibernate.ddl-auto=update`).
- Only list and create endpoints are currently implemented; update and delete endpoints are not included.
