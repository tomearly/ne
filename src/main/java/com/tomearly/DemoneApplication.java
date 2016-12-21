package com.tomearly;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.web.SpringBootServletInitializer;

@SpringBootApplication
public class DemoneApplication extends org.springframework.boot.web.support.SpringBootServletInitializer{
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(DemoneApplication.class);
	}
	public static void main(String[] args) {
		SpringApplication.run(DemoneApplication.class, args);
	}
}
