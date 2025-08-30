package com.dio.meuprimeiroapi.controller;

import com.dio.meuprimeiroapi.model.User;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
public class UserController {

    @GetMapping("/users")
    public List<User> getUsers() {
        List<User> users = new ArrayList<>();
        users.add(new User(1L, "Rodrigo"));
        users.add(new User(2L, "Maria"));
        return users;
    }
}
