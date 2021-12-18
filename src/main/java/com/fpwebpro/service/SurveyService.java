package com.fpwebpro.service;

import com.fpwebpro.model.Response;
import com.fpwebpro.model.Survey;
import com.fpwebpro.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import static org.aspectj.runtime.internal.Conversions.floatValue;

@Service
public class SurveyService {
    @Autowired
    private CustomerRepository customerRepository;
    @Autowired
    private ResponseRepository responseRepository;
    @Autowired
    private SurveyRepository surveyRepository;

    public int counter = 0;
    public int responsesTotal = 0;
    public int responseCount = 0;
    public float responsesAvg = 0;
    public int surveyCount = 0;

    // avg responses each survey item
    public ArrayList<Float> itemSurveyAvg = new ArrayList<Float>(0);

    public Iterable<Survey> getAllSurveys() {
        return surveyRepository.findAll();
    }

    public void saveSurvey(Survey survey) {
        surveyRepository.save(survey);
    }

    public Survey getSurveyById(Long id) {
        return surveyRepository.getOne(id);
    }

    public void deleteSurveyById(Long id) {
        surveyRepository.deleteById(id);
    }

    // update the value
    public void getSurveysAverage() {
        Iterable<Survey> allData = surveyRepository.findAll();

        itemSurveyAvg.clear();
        counter = 0;
        responsesTotal = 0;
        responseCount = 0;
        surveyCount = 0;
        responsesAvg = 0;
        for (Survey itemSurvey : allData) {
            counter++;
            surveyCount++;
            int itemSurveyCount = 0;
            int itemSurveyResponsesCount = 0;
            for ( Response itemResponse : itemSurvey.getResponses() ) {
                responsesTotal += itemResponse.getResponse();
                responseCount++;
                itemSurveyCount++;
                itemSurveyResponsesCount++;
            }
            int divider = 1;
            int dividerResponseCount = 1;
            if ( itemSurveyCount != 0 ) divider = itemSurveyCount;
            if ( responseCount != 0 ) dividerResponseCount = responseCount;
            responsesAvg = floatValue(responsesTotal) / floatValue(responseCount);
            itemSurveyAvg.add( floatValue(itemSurveyResponsesCount) / floatValue(divider) );
        }
    }

    public int getSurveysCount() {
        return size( surveyRepository.findAll() );
    }

    public int size(Iterable data) {

        if (data instanceof Collection) {
            return ((Collection<?>) data).size();
        }

        int counter = 0;
        for (Object i : data) {
            counter++;
        }
        return counter;
    }
}
