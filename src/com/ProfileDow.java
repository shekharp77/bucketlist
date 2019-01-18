/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import static com.CustomDishDow.con;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.Part;

/**
 *
 * @author user
 */
public class ProfileDow {
    static PreparedStatement ps;
    static Connection con = Sql.getConnection();
    public static int insertData(String username, String fullname, String userage, String sex, String speciality, String area, String email, String about,Part image) {
        InputStream stream = null;
        int i = 0;
        int age = Integer.parseInt(userage);
        System.out.println("-================================="+fullname);
        try {
            stream = image.getInputStream();
            ps = con.prepareStatement("insert into profile values(?,?,?,?,?,?,?,?,?);");
            ps.setString(1, username);
            ps.setString(2, fullname);
            ps.setInt(3, age);
            ps.setString(4, sex);
            ps.setString(5,speciality);
            ps.setString(6,area);
            ps.setString(7, email);
            ps.setString(8, about);
            ps.setBlob(9, stream);
            i = ps.executeUpdate();
            ResultSet rs = con.createStatement().executeQuery("select image from profile where username ='"+username+"'");
                rs.next();
                saveImage(rs.getBlob(1), username);
            
        } catch (Exception ex) {
            ex.printStackTrace();
            Logger.getLogger(ProfileDow.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stream.close();
            } catch (IOException ex) {
                ex.printStackTrace();
                Logger.getLogger(ProfileDow.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return i;
    }
    
    
    
    //getting image
    public static void saveImage(Blob blob, String username){
        FileOutputStream fos = null;
        try {
            InputStream input;
            fos = new FileOutputStream("C:\\Users\\user\\Documents\\NetBeansProjects\\BucketList\\web\\resources\\dps\\"+username.toLowerCase()+".jpg");
            {
               
                input = blob.getBinaryStream();
                int i=0;
                i++;
                int c = 0;
                while ((c = input.read()) > -1) {
                    fos.write(c);
                }
            }
            input.close();
            System.out.println("Success============================      ");
        } catch (FileNotFoundException ex) {
            ex.printStackTrace();
            Logger.getLogger(CustomDishDow.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            ex.printStackTrace();
            Logger.getLogger(CustomDishDow.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CustomDishDow.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                fos.close();
            } catch (IOException ex) {
                Logger.getLogger(CustomDishDow.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    public static void getdeatails(String username){
        try {
            Statement st = con.createStatement();
            ResultSet rs= st.executeQuery("Select * from profile where username = '"+username+"';");
            rs.next();
            ProfileBean.setUsername(rs.getString(1));
            ProfileBean.setFullname(rs.getString(2));
            ProfileBean.setAge(rs.getInt(3));
            ProfileBean.setGender(rs.getString(4));
            ProfileBean.setSpeciality(rs.getString(5));
            ProfileBean.setArea(rs.getString(6));
            ProfileBean.setEmail(rs.getString(7));
            ProfileBean.setAbout(rs.getString(8));
                    } catch (SQLException ex) {
            Logger.getLogger(ProfileDow.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}












