// Property.java
package com.virtusa.pgrental.model;

import java.time.Period;
import java.util.List;

public class Property {
    private int pid;
    private String pgName;
    private String pgType;
    private String address;
    private String phoneNumber;
    private List<String> photoFileNames;

    // Constructor
    public Property(){

    }
    public Property(String pgName, String pgType, String address, String phoneNumber, List<String> photoFileNames) {
        this.pgName = pgName;
        this.pgType = pgType;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.photoFileNames = photoFileNames;
    }

    // Getters and setters
    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPgName() {
        return pgName;
    }

    public void setPgName(String pgName) {
        this.pgName = pgName;
    }

    public String getPgType() {
        return pgType;
    }

    public void setPgType(String pgType) {
        this.pgType = pgType;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public List<String> getPhotoFileNames() {
        return photoFileNames;
    }

    public void setPhotoFileNames(List<String> photoFileNames) {
        this.photoFileNames = photoFileNames;
    }
}
