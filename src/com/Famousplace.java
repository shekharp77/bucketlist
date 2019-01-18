/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author user
 */
public class Famousplace {
    
    static Connection con = Sql.getConnection();
    
    public static int insertdata(String uniqname, String name, String type,String time, String genere, String city ){
        int i = 0;
        try {
            PreparedStatement ps = con.prepareStatement("insert into famousplace values(?, ?, ?, ?, ?, ?);");
            ps.setString(1, uniqname);
            ps.setString(2, name);
            ps.setString(3, type);
            ps.setString(4, time);
            ps.setString(5, genere);
            ps.setString(6, city);
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Famousplace.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }
    
    public static List getPlace(String city){
        List li = new ArrayList();
        try{
            System.out.println(city+"-----------");
            ResultSet st = con.createStatement().executeQuery("Select * from famousplace where city = '"+city+"'; ");
            while(st.next()){
                li.add(st.getString(1));
                System.out.print(st.getString(1)+"''''''''''''''''");
            }
        }catch(Exception ex){
        }
        return li;
    }
    
    public static void getInsert(String unqplacename){
       
        try{
            System.out.println(unqplacename+"kcsssssssssslkm");
            ResultSet st = con.createStatement().executeQuery("Select * from famousplace where unqplacename = '"+unqplacename+"'; ");
                if(st.next()){
                    System.out.println("==++++++++jkbjblhlb");
                FamousplaceBean.setUnqplacename(st.getString(1));
                FamousplaceBean.setName(st.getString(2));
                FamousplaceBean.setType(st.getString(3));
                FamousplaceBean.setTime(st.getString(4));
                FamousplaceBean.setGenere(st.getString(5));
                FamousplaceBean.setCity(st.getString(6));
                }
             
        }catch(Exception ex){
        }
    }
}
