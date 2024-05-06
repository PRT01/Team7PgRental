package com.virtusa.pgrental.validator;



public class Validator {
    public static boolean validateName(String name) {

        return !name.isEmpty();
    }

    public static boolean validateEmail(String email) {

        return email.matches("[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}");
    }

    public static boolean validatePassword(String pass, String rePass) {

        return pass.equals(rePass);
    }

    public static boolean validateMobile(String mobile) {

        return mobile.matches("\\d{10}");
    }
}

