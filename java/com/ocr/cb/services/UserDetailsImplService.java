package com.ocr.cb.services;


import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User.UserBuilder;

import com.ocr.cb.entities.User;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class UserDetailsImplService implements UserDetailsService {
    private final static Logger log = LogManager.getLogger(UserDetailsImplService.class);

    @Autowired
    UserService userService;

    public UserDetailsImplService() {
    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {

        User user = findUserbyUsername(email);

        UserBuilder builder = null;
        if (user == null) {
            throw new UsernameNotFoundException("User not found.");
        }
        log.info("Nouvel utilisateur logué. Nom: {}, prénom: {}", user.getLastName(), user.getFirstName());
        return new MyUserPrincipal(user);
    }

    private User findUserbyUsername(String email) {
        return userService.findByEmail(email);
    }
}
