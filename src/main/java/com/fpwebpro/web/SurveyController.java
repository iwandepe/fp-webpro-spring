package com.fpwebpro.web;

import com.fpwebpro.service.SecurityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SurveyController {
    @Autowired
    private SecurityService securityService;

    @GetMapping("/home")
    public String registration() {
        return "home";
    }
}
