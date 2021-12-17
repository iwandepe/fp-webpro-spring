package com.fpwebpro.web;

import com.fpwebpro.model.User;
import com.fpwebpro.service.SecurityService;
import com.fpwebpro.service.SurveyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SurveyController {
    @Autowired
    private SecurityService securityService;

    @Autowired
    private SurveyService surveyService;

    @GetMapping("/dashboard")
    public String registration() {
        return "dashboard";
    }

    @GetMapping("/surveys")
    public String getSurveyDataPage(Model model) {
        model.addAttribute("surveys", surveyService.getAllSurveys());

        return "survey-data";
    }
}
