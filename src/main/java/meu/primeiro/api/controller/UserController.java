package meu.primeiro.api.controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;
import java.util.ArrayList;

@RestController
public class UserController {

    @GetMapping("/users")
    public List<String> getAllUsers() {
        List<String> users = new ArrayList<>();
        users.add("Rodrigo");
        users.add("Maria");
        users.add("João");
        return users;
    }

}
