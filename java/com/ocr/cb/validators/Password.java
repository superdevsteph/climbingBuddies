package com.ocr.cb.validators;


import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Documented
@Constraint(validatedBy = PasswordValidator.class)
@Target({ElementType.METHOD, ElementType.FIELD, ElementType.PARAMETER, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
public @interface Password {

    String message() default "le mot de passe n'est pas assez fort";

    String label() default "password";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}

