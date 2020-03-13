package com.ocr.cb.validators;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class PhoneValidator implements ConstraintValidator<Phone, String> {

    @Override
    public void initialize(Phone paramA) {
    }

    @Override
    public boolean isValid(String phoneNo, ConstraintValidatorContext ctx) {
        if (phoneNo == null) {
            return true;
        }
        //validate phone numbers of format "0102030405"
        if (phoneNo.matches("\\d{10}")) return true;
        else return false;
    }
}