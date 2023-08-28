package com.example.demo_fidas;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@RestController
public class DemoFidasApplication {

	public static void main(String[] args) {
		SpringApplication.run(DemoFidasApplication.class, args);
	}

	@GetMapping("/hello")
	public String hello(){
		return "Germinare Tech - Fidas";
	} 

}
