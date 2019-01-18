/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.io.InputStream;
import java.sql.Blob;

/**
 *
 * @author user
 */
public class CustomDishBean {
    static String  uniqname, name, description, type, genere, taste, time,by;
    static Blob stream;
    static int averagetime, calories;
    
    
    // setter methods
    public static void setName(String name) {
        CustomDishBean.name = name;
    }
    
     public static void setcalories(int calories) {
        CustomDishBean.calories = calories;
    }
    
    public static void setuniqname(String uniqname) {
        CustomDishBean.uniqname = uniqname;
    }

    public static void setDescription(String description) {
        CustomDishBean.description = description;
    }

    public static void setType(String type) {
        CustomDishBean.type = type;
    }

    public static void setGenere(String genere) {
        CustomDishBean.genere = genere;
    }

    public static void setTaste(String taste) {
        CustomDishBean.taste = taste;
    }

    public static void setTime(String time) {
        CustomDishBean.time = time;
    }

    public static void setBy(String by) {
        CustomDishBean.by = by;
    }

    public static void setBlob(Blob stream) {
        CustomDishBean.stream = stream;
    }

    public static void setAveragetime(int averagetime) {
        CustomDishBean.averagetime = averagetime;
    }

    
    
    
    
    // getter methods
     public static String getUniqname() {
        return uniqname;
    }
    
    public static String getName() {
        return name;
    }

    public static String getDescription() {
        return description;
    }

    public static String getType() {
        return type;
    }

    public static String getGenere() {
        return genere;
    }

    public static String getTaste() {
        return taste;
    }

    public static String getTime() {
        return time;
    }

    public static String getBy() {
        return by;
    }

    public static Blob getBlob() {
        return stream;
    }

    public static int getAveragetime() {
        return averagetime;
    }
    
    public static int getCal() {
        return calories;
    }
}
