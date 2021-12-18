package com.fpwebpro.model;

import java.util.ArrayList;

public class ResponsesCreationRequest {

    //    public Customer customer;
    private String name;
    private String email;
    private String occupation;
    private ArrayList<String> responses;
    private ArrayList<String> survey_id;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getOccupation() {
        return occupation;
    }

    public void setOccupation(String occupation) {
        this.occupation = occupation;
    }

    public Iterable<String> getResponses() {
        return responses;
    }

    public void setResponses(ArrayList<String> responses) {
        this.responses = responses;
    }

    public ArrayList<String> getSurvey_id() {
        return survey_id;
    }

    public void setSurvey_id(ArrayList<String> survey_id) {
        this.survey_id = survey_id;
    }

    /*
    public ResponsesCreationRequest(String name,
                                    String email,
                                    String occupation,
                                    Iterable<Integer> responses,
                                    Iterable<Integer> survey_id) {
        this.name = name;
        this.email = email;
        this.occupation = occupation;
        this.responses = responses;
        this.survey_id = survey_id;
    }
    */
}
