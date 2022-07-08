package com.example.opcdemo;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.validation.annotation.Validated;

@SpringBootApplication
public class OpcDemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(OpcDemoApplication.class, args);
	}

}
