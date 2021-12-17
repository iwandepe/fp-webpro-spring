package com.fpwebpro.service;

import com.fpwebpro.model.Survey;
import com.fpwebpro.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Iterator;

@Service
public class SurveyService {
    @Autowired
    private CustomerRepository customerRepository;
    @Autowired
    private ResponseRepository responseRepository;
    @Autowired
    private SurveyRepository surveyRepository;

    public Iterable<Survey> getAllSurveys() {
        return surveyRepository.findAll();
    }

    public void saveSurvey(Survey survey) {
        surveyRepository.save(survey);
    }
}
