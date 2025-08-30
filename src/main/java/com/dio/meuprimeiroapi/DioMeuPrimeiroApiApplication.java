package com.dio.meuprimeiroapi;

import com.dio.meuprimeiroapi.model.User;
import com.dio.meuprimeiroapi.repository.UserRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class DioMeuPrimeiroApiApplication {

	public static void main(String[] args) {
		SpringApplication.run(DioMeuPrimeiroApiApplication.class, args);
	}

	@Bean
	CommandLineRunner initDatabase(UserRepository repository) {
		return args -> {
			repository.save(new User(null, "Rodrigo Tapia", "rodrigo@email.com"));
			repository.save(new User(null, "Maria Silva", "maria@email.com"));
		};
	}
}
