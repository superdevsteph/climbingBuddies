package com.ocr.cb.beans;

public class UserInfo {
    private Integer id;
    private String firstName;
    private String lastName;
    private String introOfName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getIntroOfName() {
        return introOfName;
    }

    public void setIntroOfName(String introOfName) {
        this.introOfName = introOfName;
    }
}
