package com.fpwebpro.web;

import com.fpwebpro.model.Survey;
import com.fpwebpro.model.User;
import com.fpwebpro.service.SecurityService;
import com.fpwebpro.service.SurveyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

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

    @GetMapping("/surveys/create")
    public String getSurveyCreatePage() {
        return "survey-create";
    }

    @PostMapping("/surveys/create")
    public String postSurveyData(@ModelAttribute("surveyForm") Survey surveyForm) {

        surveyService.saveSurvey(surveyForm);

        return "redirect:/surveys";
    }
}
