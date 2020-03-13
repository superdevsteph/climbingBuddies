package com.ocr.cb.services;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.ocr.cb.entities.User;

import javax.validation.Validator;
import java.util.HashMap;
import java.util.Map;


@Service
public class ValidateObjectService {
    private final Logger log = LogManager.getLogger(ValidateObjectService.class);

    @Autowired
    Validator validator;

    /**
     * Valide an Object from its annotations in package com.ocr.noel.validators
     * @param object to analyze
     * @return an empty map if any error, in otherwise a map with found errors
     */
    public Map<String, String> validate(Object object) {
        log.debug("dans ValidateObjectService");
        Map<String, String> mapError = new HashMap<>();
        if (object.getClass().equals(User.class)) {
            User user = (User) object;
            validator.validate(user).forEach(error -> {
                String label =  (String) error.getConstraintDescriptor().getAttributes().get("label");
                log.debug("label: {}", label);
                String message = (String) error.getConstraintDescriptor().getAttributes().get("message");
                log.debug("message: {}", message);
                mapError.put(label, message);
            });
        }
        return mapError;
    }
}
