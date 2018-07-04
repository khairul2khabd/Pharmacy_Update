/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.pharmacy.model;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author Khairul
 */
public class PhaPatientSearch implements Serializable {

    private Integer patientId;
    private String identifier;
    private String fullname;
    private String givenName;
    private String middleName;
    private String familyName;
    private String gender;
    private Date birthdate;
    private Integer age;
    private Integer personNameId;
    private String phoneNo;

    public Integer getPatientId() {
        return patientId;
    }

    public void setPatientId(Integer patientId) {
        this.patientId = patientId;
    }

    public String getIdentifier() {
        return identifier;
    }

    public void setIdentifier(String identifier) {
        this.identifier = identifier;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getGivenName() {
        return givenName;
    }

    public void setGivenName(String givenName) {
        this.givenName = givenName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getFamilyName() {
        return familyName;
    }

    public void setFamilyName(String familyName) {
        this.familyName = familyName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(Date birthdate) {
        this.birthdate = birthdate;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Integer getPersonNameId() {
        return personNameId;
    }

    public void setPersonNameId(Integer personNameId) {
        this.personNameId = personNameId;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    @Override
    public String toString() {
        return "PhaPatientSearch{" + "patientId=" + patientId 
                + ", identifier=" + identifier 
                + ", fullname=" + fullname 
                + ", givenName=" + givenName 
                + ", middleName=" + middleName 
                + ", familyName=" + familyName + ", gender=" + gender
                + ", birthdate=" + birthdate + ", age=" + age 
                + ", personNameId=" + personNameId + ", phoneNo=" + phoneNo + '}';
    }

}
