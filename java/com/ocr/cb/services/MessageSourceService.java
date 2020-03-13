package com.ocr.cb.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.NoSuchMessageException;
import org.springframework.stereotype.Service;

import java.util.Locale;

@Service
public class MessageSourceService {

    @Autowired
    MessageSource messageSource;

    public String getMessage(String key, Locale locale) {
        try {
            String value = messageSource.getMessage(key, null, locale);
            if (value != null) {
                return value;
            }
        } catch (NoSuchMessageException e) {
            return "";
        }
        return "";
    }
}
