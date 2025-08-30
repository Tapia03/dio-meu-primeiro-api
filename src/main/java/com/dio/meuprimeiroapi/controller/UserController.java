package com.dio.meuprimeiroapi.controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

@RestController
@RequestMapping ("/users")
public class UserController {

    @GetMapping
    public List<String> getAllUsers() {
        return List.of("Rodrigo", "Maria", "João");
    }
}
