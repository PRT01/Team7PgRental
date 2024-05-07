package com.virtusa.pgrental.validation;
public class InputValidation {
    public static boolean validateInput(String name, String email, String mobile) {
        return validateName(name) && validateEmail(email) && validateMobile(mobile);
    }
    private static boolean validateName(String name) {
        return !name.isEmpty() && !name.matches(".*\\d.*");
    }
    public static boolean validateEmail(String email) {
        return email.matches("[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}");
    }
    public static boolean validateMobile(String mobile) {
        return mobile.matches("\\d{10}");
    }
}