package com;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author user
 */
public class AccountDow {
    String username, password, type;
    int status;
    static Connection con = Sql.getConnection();
    //To signup a user
    public static int signup(String username,String password1,String password2){
            
            int i = 0;
        try{
            if(password1.equals(password2)){
                PreparedStatement ps;
                ps=con.prepareStatement("insert into account values(?,?,?,?);");
                ps.setString(1, username);
                ps.setString(2, password1);
                ps.setInt(3, 1);
                ps.setString(4, "user");
                i = ps.executeUpdate();
            }
        }catch(SQLException ex){
            ex.printStackTrace();
        }
            return i ;
    }
    
    //To login a user
    public static int login(String username,String Password){
        int i = 0;
        try{
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from account where username='"+username+"';");
            if(rs.next()){
                if(rs.getString(2).equals(Password)){
                    if(rs.getInt(3)==0){
                        i = st.executeUpdate("update login set status=1 where username='"+username+"';");
                        return i;
                    }
                    else{
                        i = 0;
                       
                    }
                }
                else{
                     i = 0;
                }
            }
            else{
                 i = 0;
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return 1;
    }
    
}
