/*


 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.sql.Connection;
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
public class rareingdow {
    static Connection con = Sql.getConnection();
    
    public static List getList(){
        List li = new ArrayList();
        try {
            ResultSet rs = con.createStatement().executeQuery("Select * from rareing;");
            while(rs.next()){
                li.add(rs.getString(1));
                System.out.println(rs.getString(1));
            }
        } catch (SQLException ex) {
            Logger.getLogger(rareingdow.class.getName()).log(Level.SEVERE, null, ex);
        }
        return li;
    }
    
    
    public static List getData(String name){
        List li = new ArrayList();
        try {
            ResultSet rs = con.createStatement().executeQuery("Select * from rareing where name = '"+name+"';");
            rs.next();
            li.add(rs.getString(1));
            li.add(rs.getString(2));
            li.add(rs.getString(3));
        } catch (SQLException ex) {
            Logger.getLogger(rareingdow.class.getName()).log(Level.SEVERE, null, ex);
        }
        return li;
    }
}
