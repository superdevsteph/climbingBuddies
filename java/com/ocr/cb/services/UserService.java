package com.ocr.cb.services;

import com.ocr.cb.beans.UserInfo;
import com.ocr.cb.entities.Address;
import com.ocr.cb.entities.User;
import com.ocr.cb.enums.RoleEnum;
import com.ocr.cb.repositories.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.LocaleResolver;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@Service
public class UserService {

    @Autowired
    UserRepository userRepository;

    @Autowired
    ValidateObjectService validateObjectService;

    @Autowired
    MessageSourceService messageSourceService;

    public User findById(Integer id) {
        return userRepository.findById(id).orElse(null);
    }

    @Transactional
    public void save(User user) {
        userRepository.save(user);
    }

    public User findByIdFetchAddress(Integer id) {
        return userRepository.findByIdFetchAddress(id).orElse(null);
    }

    @Transactional
    public void deleteById(Integer id) {
        userRepository.deleteById(id);
    }

    @Transactional
    public void delete(User user) {
        userRepository.delete(user);
    }

    public User findByEmail(String email) {
        return userRepository.findByEmail(email).orElse(null);
    }

    public boolean isExistingEmail(String email) {
        User user = findByEmail(email);
        return user != null;
    }

    /**
     * This method save a new user
     *
     * @param email           email
     * @param password        pwd
     * @param passwordconfirm the confirm pwd
     * @param firstname       his first name
     * @param lastname        his last name
     * @return true if all is ok false otherwise
     */
    public Map<String, String> setNewUser(String email, String password, String passwordconfirm, String firstname,
                                          String lastname, Locale locale) {
        Map<String, String> mapModel = new HashMap<>();
        if (isExistingEmail(email)) {
            mapModel.put("error", messageSourceService.getMessage("user.already.existing", locale));
            return mapModel;
        }
        User user = new User();
        if (password != null && password.equals(passwordconfirm)) {
            user.setPwd(password);
        } else {
            mapModel.put("error", messageSourceService.getMessage("passwords.donot.matching", locale));
            return mapModel;
        }
        if (firstname == null || firstname.length() < 1 || lastname == null || lastname.length() < 1) {
            mapModel.put("error", messageSourceService.getMessage("expected.first.last.name", locale));
            return mapModel;
        }
        user.setEmail(email);
        user.setFirstName(firstname);
        user.setLastName(lastname);
        user.setRole(RoleEnum.ROLE_USER.getNum());
        Map<String, String> mapError = validateObjectService.validate(user);
        if (mapError.size() == 0) {
            save(user);
            mapModel.put("message", messageSourceService.getMessage("registration.right", locale));
            return mapModel;
        } else {
            StringBuffer sb = new StringBuffer(messageSourceService.getMessage("registration.unagree", locale));
            mapError.forEach((k, v) -> {
                sb.append(", ");
                sb.append(v);
            });
            mapModel.put("error", sb.toString());
        }
        return mapModel;
    }

    /**
     * get user from principal and if existing then DataBase
     *
     * @param principal the logued user
     * @return user updated
     */
    public User getUserFromPrincipalAndDB(Principal principal) {
        User userDB = null;
        try {
            if (principal != null) {
                userDB = ((MyUserPrincipal) ((UsernamePasswordAuthenticationToken) principal).getPrincipal()).getUser();
                userDB = findByIdFetchAddress(userDB.getId());
            }
        } catch (Exception e) {
            return null;
        }
        return userDB;
    }

    public Map<String, String> getMapFormMonCompte(User user) {
        Map<String, String> map = new HashMap<>();
        map.put("email", user.getEmail());
        map.put("firstname", user.getFirstName());
        map.put("lastname", user.getLastName());
        map.put("phonenumber", user.getPhonenumber());
        Address address = user.getAddress();
        if (address != null) {
            map.put("address", address.getAddress());
            map.put("city", address.getCity());
            map.put("zipcode", address.getZipcode());
            map.put("country", address.getCountry());
        }
        return map;
    }

    public Map<String, String> updateUserInformation(String email, String password, String passwordconfirm, String firstname,
                                         String lastname, String phonenumber, String address, String city,
                                         String zipcode, String country, User user) {
        Map<String, String> map = new HashMap<>();
        if (user == null) {
            map.put("errorOccurred","errorOccurred");
        }
        if (email != null && email.length() > 0 && !isExistingEmail(email)) {
            user.setEmail(email);
        }
        if (password != null && password.length() > 0) {
            if (password.length() <= 100 && password.equals(passwordconfirm)) {
                user.setPwd(password);
            } else {
                map.put("errorOccurred","errorOccurred");
                map.put("passworderror", "erreur");
            }
        }
        if (firstname != null && firstname.length() > 0 && firstname.length() <= 50) user.setFirstName(firstname);
        if (lastname != null && lastname.length() > 0 && lastname.length() <= 50) user.setLastName(lastname);
        if (phonenumber != null && phonenumber.length() > 0) {
            phonenumber = phonenumber.replace(" ", "").replace(".", "").replace("-", "");
            if (phonenumber.length() <= 10) user.setPhonenumber(phonenumber);
        }
        if (user.getAddress() == null) {
            user.setAddress(new Address());
        }
        if (address != null && address.length() > 0 && address.length() <= 255) user.getAddress().setAddress(address);
        if (city != null && city.length() > 0 && city.length() <= 50) user.getAddress().setCity(city);
        if (zipcode != null && zipcode.length() > 0 && zipcode.length() <= 5) user.getAddress().setZipcode(zipcode);
        if (country != null && country.length() > 0 && country.length() <= 50) user.getAddress().setCountry(country);
        Map<String, String> mapCompte = getMapFormMonCompte(user);
        map.putAll(mapCompte);
        Map<String, String> mapError = validateObjectService.validate(user);
        if (mapError.size() == 0) {
            save(user);
        } else {
            map.put("errorOccurred","errorOccurred");
            return map;
        }
        return map;
    }

    /**
     * if the user is at least an association member return true otherwise false
     *
     * @param principal principal logued
     * @return if is association member or more
     */
    public boolean isAtLeastAssociationLevel(Principal principal) {
        User user = getUserFromPrincipalAndDB(principal);
        return isAtLeastAssociationLevelFromUser(user);
    }

    public boolean isAtLeastAssociationLevelFromUser(User user) {
        if (user == null) return false;
        RoleEnum role = RoleEnum.getRole(user.getRole());
        if (role != null && RoleEnum.ROLE_ASSO.getNum() <= role.getNum()) return true;
        return false;
    }
    public Page<User> getPageableSorted(Integer numPage, Integer nberInPage) {
        if (numPage < 0) numPage = 0;
        PageRequest pageRq = PageRequest.of(numPage, nberInPage, Sort.by("lastName").ascending().and(Sort.by("firstName").ascending()));
        Page<User> page = userRepository.findAll(pageRq);
        return page;
    }

    public UserInfo getUserInfo(Integer id, Principal principal, Locale locale) {
        UserInfo userInfo = new UserInfo();
        User user = userRepository.findById(id).orElse(null);
        if (user == null) {
            return userInfo;
        }
        userInfo.setId(user.getId());
        userInfo.setFirstName(user.getFirstName());
        userInfo.setLastName(user.getLastName());
        userInfo.setIntroOfName(messageSourceService.getMessage("prefix.userinfo", locale));
        return  userInfo;
    }
}
