package com.example.demo;

import org.springframework.web.bind.annotation.*;
import java.util.*;

@RestController
@RequestMapping("/students")
public class StudentController {

    List<String> students = new ArrayList<>();

    @GetMapping
    public List<String> getStudents() {
        return students;
    }

    @PostMapping
    public String addStudent(@RequestBody String student) {
        students.add(student);
        return "Student Added";
    }
}