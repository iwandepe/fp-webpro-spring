package com.fpwebpro.model;

import java.util.ArrayList;

public class ResponsesCreationRequest {
//    public Customer customer;
    public String name;
    public String email;
    public String occupation;
    public Iterable<Integer> responses;
    public Iterable<Integer> survey_id;

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
}
