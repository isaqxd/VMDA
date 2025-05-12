package com.vmda.bank;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;

@SpringBootApplication
public class BankvmdaApplication {

	@GetMapping("/")
	public static void main(String[] args) {
		SpringApplication.run(BankvmdaApplication.class, args);
	}

}
