package com.example.opcdemo;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @Value("${forr.openshift.someproperty}")
    String someProperty;

    @Value("${spring.datasource.username}")
    String dbUser;


    @GetMapping(path = "/hello/{name}")
    public String home(@PathVariable(value = "name") String name){
        return "Hello " + name + " with some property with db user: " + dbUser;
    }
}