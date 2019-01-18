/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.Part;

/**
 *
 * @author user
 */
public class CustomDishDow {
    static Connection con = Sql.getConnection();
    
    // Save image
    public static void saveImage(Blob blob, String uniqname){
        FileOutputStream fos = null;
        try {
            InputStream input;
            fos = new FileOutputStream("C:\\Users\\user\\Documents\\NetBeansProjects\\BucketList\\web\\resources\\images\\"+uniqname+".jpg");
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
    
    // Insert a custom dish
    public static int addCustomDish(String unqname,String name, String description, String type, String genere, String taste, String time, String avgtime, Part image, String username,String calories){
        int i = 0;
        System.out.println("======================="+calories);
        int cal = Integer.parseInt(calories);
        InputStream stream;
        System.out.println(type+taste+genere+time);
        int averagetime = Integer.parseInt(avgtime);
            try{
                stream = image.getInputStream();
                PreparedStatement ps = con.prepareStatement("insert into customdish values(?,?,?,?,?,?,?,?,?,?,?);");
                ps.setString(1, unqname);
                ps.setString(2, name);
                ps.setString(3, description);
                ps.setString(4, type);
                ps.setString(5, genere);
                ps.setString(6, taste);
                ps.setString(7, time);
                ps.setInt(8, averagetime);
                ps.setBlob(9, stream);
                ps.setString(10, username);
                ps.setInt(11,cal);
                i = ps.executeUpdate();
                ResultSet rs = con.createStatement().executeQuery("select image from customdish where uniqname ='"+unqname+"'");
                rs.next();
                saveImage(rs.getBlob(1), unqname);
                
            }catch(Exception ex){
                ex.printStackTrace();
            }
        return i;
    }
    
    public static List getList(String[] type, String[] genere, String[] taste, String[] time){
                List li = new ArrayList();
        try {
            
            System.out.println(type[0]+" ----------------------------------");
            
            String query="select uniqname from CustomDish where type in (";
            
            int value = 0;
            //type
            String mytype="";
            for(int i=0;i<type.length;i++)
            {
              mytype+=",?";
            }
            mytype=mytype.replaceFirst(",","");
            mytype+=")";
            query=query+mytype;
            query+=" and genere in (";
            
            //genere
            String mygenere="";
            for(int i=0;i<genere.length;i++)
            {
              mygenere+=",?";
            }
            mygenere=mygenere.replaceFirst(",","");
            mygenere+=")";
            query=query+mygenere;
            query+=" and taste in (";
            
            //taste
            String mytaste="";
            for(int i=0;i<taste.length;i++)
            {
              mytaste+=",?";
            }
            mytaste=mytaste.replaceFirst(",","");
            mytaste+=")";
            query=query+mytaste;
            query+=" and time in (";
            
            //time
            String mytime="";
            for(int i=0;i<time.length;i++)
            {
              mytime+=",?";
            }
            mytime=mytime.replaceFirst(",","");
            mytime+=")";
            query=query+mytime;
            query+=";";
            
            System.out.println(query+"         "+"=========================================");
            PreparedStatement ps = con.prepareStatement(query);
            
            for(int i=0;i<type.length;i++)
            {
              value++;
              ps.setString(value, type[i]);
              System.out.println(type[i]+""+value);
            }
            
            for(int i=0;i<genere.length;i++)
            {
              value++;
              ps.setString(value, genere[i]);
              System.out.println(genere[i]+""+value);
            }
            
            for(int i=0;i<taste.length;i++)
            {
              value++;
              ps.setString(value, taste[i]);
              System.out.println(taste[i]+""+value);
            }
            
            for(int i=0;i<time.length;i++)
            {
              value++;
              ps.setString(value, time[i]);
              System.out.println(time[i]+""+value);
            }
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                li.add(rs.getString(1));
            }
            
            
            
            System.out.println(li.size());
            
        } catch (Exception ex) {
            ex.printStackTrace();
            Logger.getLogger(CustomDishDow.class.getName()).log(Level.SEVERE, null, ex);
        }
        return li;
    }
    
    
    
    // getting details of all dishes
    public static void getInfo(String uniqname) throws IOException {
        try {
            PreparedStatement qs= con.prepareStatement("select * from CustomDish where uniqname ='"+uniqname+"'");
            ResultSet rs = qs.executeQuery();
            if(rs.next()){
                CustomDishBean.setuniqname(rs.getString(1));
                CustomDishBean.setName(rs.getString(2));
                CustomDishBean.setDescription(rs.getString(3));
                CustomDishBean.setType(rs.getString(4));
                CustomDishBean.setGenere(rs.getString(5));
                CustomDishBean.setTaste(rs.getString(6));
                CustomDishBean.setTime(rs.getString(7));
                CustomDishBean.setAveragetime(rs.getInt(8));
                CustomDishBean.setBlob(rs.getBlob(9));
                CustomDishBean.setcalories(rs.getInt(11));
                InputStream input;             
                System.out.println("Success============================");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            Logger.getLogger(CustomDishDow.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    
    // getting my dishes
    public static List getMyData(String username){
        List li = new ArrayList();
        try {
            ResultSet rs = con.createStatement().executeQuery("select uniqname from customdish where username ='"+username+"'");
            while(rs.next()){
                li.add(rs.getString(1));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            Logger.getLogger(CustomDishDow.class.getName()).log(Level.SEVERE, null, ex);
        }
        return li;
    }
    
    
    
    // getting details of all dishes
    public static void getProfileInfo(String username) throws IOException {
        try {
            System.out.println("Success============================      "+username);
            PreparedStatement ps = con.prepareStatement("select * from CustomDish where username ='"+username+"'");
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                CustomDishBean.setuniqname(rs.getString(1));
                CustomDishBean.setName(rs.getString(2));
                CustomDishBean.setDescription(rs.getString(3));
                CustomDishBean.setType(rs.getString(4));
                CustomDishBean.setGenere(rs.getString(5));
                CustomDishBean.setTaste(rs.getString(6));
                CustomDishBean.setTime(rs.getString(7));
                CustomDishBean.setAveragetime(rs.getInt(8));
                CustomDishBean.setBlob(rs.getBlob(9));
                CustomDishBean.setcalories(rs.getInt(11));
                System.out.println("Success============================      ");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            Logger.getLogger(CustomDishDow.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
}
