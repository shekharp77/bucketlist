/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

/**
 *
 * @author user
 */
public class ProfileBean {
    static String username, fullname, gender, speciality, area, email, about;
    static int age;

    public static String getUsername() {
        return username;
    }

    public static String getFullname() {
        return fullname;
    }

    public static String getGender() {
        return gender;
    }

    public static String getSpeciality() {
        return speciality;
    }

    public static String getArea() {
        return area;
    }

    public static String getEmail() {
        return email;
    }

    public static String getAbout() {
        return about;
    }

    public static int getAge() {
        return age;
    }

    public static void setUsername(String username) {
        ProfileBean.username = username;
    }

    public static void setFullname(String fullname) {
        ProfileBean.fullname = fullname;
    }

    public static void setGender(String gender) {
        ProfileBean.gender = gender;
    }

    public static void setSpeciality(String speciality) {
        ProfileBean.speciality = speciality;
    }

    public static void setArea(String area) {
        ProfileBean.area = area;
    }

    public static void setEmail(String email) {
        ProfileBean.email = email;
    }

    public static void setAbout(String about) {
        ProfileBean.about = about;
    }

    public static void setAge(int age) {
        ProfileBean.age = age;
    }
    
    
    
}
