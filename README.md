# REST_API

A simple Spring Boot REST API project for managing a list of students.

## Overview

This project is a minimal Spring Boot application that demonstrates a basic RESTful API with in-memory data storage.
The API provides endpoints to retrieve the current list of students and add new student names during the running session.

## Project Structure

- `src/main/java/com/example/demo/DemoApplication.java` - Spring Boot application entry point
- `src/main/java/com/example/demo/StudentController.java` - REST controller with student endpoints
- `src/main/resources/application.properties` - Spring Boot configuration file
- `pom.xml` - Maven build file and dependency list

## API Endpoints

### GET /students

Returns the current list of student names as a JSON array.

Response example:

```json
["John Doe", "Jane Smith"]
```

### POST /students

Adds a new student name to the in-memory list.

Request body example:

```text
John Doe
```

Response:

```text
Student Added
```

## Requirements

- Java 17 or later
- Maven (wrapper included)

## Build and Run

From the project root directory:

```bash
./mvnw clean package
./mvnw spring-boot:run
```

On Windows PowerShell:

```powershell
./mvnw.cmd clean package
./mvnw.cmd spring-boot:run
```

The application starts on port `8080` by default.

## Example Requests

Retrieve all students:

```bash
curl http://localhost:8080/students
```

Add a student:

```bash
curl -X POST http://localhost:8080/students -H "Content-Type: text/plain" -d "John Doe"
```

## Development Notes

- The student list is stored in memory and resets every time the application restarts.
- This project uses Spring Boot `3.5.14` and `spring-boot-starter-web`.
- It is intended as a starting point for learning Spring Boot REST APIs.

## Next Steps

Possible improvements:

- Add validation and JSON request support for student objects
- Persist data using a database like H2, PostgreSQL, or MySQL
- Add error handling and logging
- Implement tests for controller behavior
