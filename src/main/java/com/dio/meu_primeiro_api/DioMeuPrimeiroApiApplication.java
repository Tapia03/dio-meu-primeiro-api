package com.dio.meu_primeiro_api;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.Collections;

@SpringBootApplication
public class DioMeuPrimeiroApiApplication {
	public static void main(String[] args) {
		SpringApplication app = new SpringApplication(DioMeuPrimeiroApiApplication.class);
		app.setDefaultProperties(Collections.singletonMap("server.port", System.getenv("PORT")));
		app.run(args);
	}
}

