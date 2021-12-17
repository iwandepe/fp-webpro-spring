package com.fpwebpro.service;

import com.fpwebpro.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
}
