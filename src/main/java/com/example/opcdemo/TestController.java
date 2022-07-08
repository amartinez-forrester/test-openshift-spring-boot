package com.example.opcdemo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @GetMapping(path = "/hello/{name}")
    public String home(@PathVariable(value = "name") String name){
        return "Hello " + name;
    }
}