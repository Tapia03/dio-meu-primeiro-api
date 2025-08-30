package com.dio.meuprimeiroapi.repository;

import com.dio.meuprimeiroapi.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    // Aqui podemos colocar consultas customizadas no futuro
}
