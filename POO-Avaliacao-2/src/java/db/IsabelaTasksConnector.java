/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import web.IsabelaDbListener;

/**
 *
 * @author isabela
 */
public class IsabelaTasksConnector {
    
     public static ArrayList<Tasks> getTasks() throws Exception {
         
        Tasks task = null;
        ArrayList<Tasks> list = new ArrayList<>();
        Connection con = IsabelaDbListener.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("select * from isabela_tasks2");
                
        while(rs.next()) {            
            long id = rs.getLong("id");
            String title = rs.getString("title");
            String user = rs.getString("user");            
            list.add(new Tasks(id, title, user));
        }
        rs.close();
        stmt.close();
        con.close();
        
        return list;
    }
    
     public static void addTask(String title, String user) throws Exception {       
        Connection con = IsabelaDbListener.getConnection();
            
        String sql = "insert into isabela_tasks2 (title, user) "
                + "values (?, ?)";        
        PreparedStatement stmt = con.prepareStatement(sql);        
        stmt.setString(1, title);
        stmt.setString(2, user);        
        stmt.execute();        
        stmt.close();
        con.close();
     }
     
     public static void removeTask(String title) throws Exception {       
        Connection con = IsabelaDbListener.getConnection();
        Statement stmt = con.createStatement();
        
        stmt.execute("delete from isabela_tasks2 where title = '"+title+"'");        
        
        stmt.close();
        con.close();
    }
    
    
    
}
