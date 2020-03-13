package com.ocr.cb.validators;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class PasswordValidator implements ConstraintValidator<Password, String> {

    @Override
    public void initialize(Password constraintAnnotation) {
    }

    @Override
    public boolean isValid(String pwd, ConstraintValidatorContext ctx) {
        if (pwd == null) {
            return false;
        }
        if (pwd.length() >= 4) return true;
        else return false;
    }
}