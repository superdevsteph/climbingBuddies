package com.ocr.cb.validators;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Documented
@Constraint(validatedBy = EmailValidator.class)
@Target({ElementType.METHOD, ElementType.FIELD, ElementType.PARAMETER, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
public @interface Email {

    String message() default "l'email n'est pas correct";

    String label() default "email";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
