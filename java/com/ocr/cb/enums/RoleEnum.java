package com.ocr.cb.enums;

public enum RoleEnum {

    ROLE_UNDEFINED(0, "ROLE_UNDEFINED"),
    ROLE_USER(1, "ROLE_USER"),
    ROLE_ASSO(2, "ROLE_ASSO");

    private byte num;
    private String name;

    RoleEnum(int num, String name) {
        this.num = (byte) num;
        this.name = name;
    }

    public String toString() {
        return name;
    }

    public byte getNum() {
        return num;
    }

    public String getName() {
        return name;
    }

    public static RoleEnum getRole(byte roleNumber) {
        if (roleNumber == ROLE_USER.getNum()) return ROLE_USER;
        if (roleNumber == ROLE_ASSO.getNum()) return ROLE_ASSO;
        return ROLE_UNDEFINED;
    }
}
