package com.dio.meu_primeiro_api.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;
import java.util.Arrays;

@RestController
public class UserController {

    @GetMapping("/users")
    public List<String> getUsers() {
        return Arrays.asList("Rodrigo", "Ana", "Maria");
    }
}
