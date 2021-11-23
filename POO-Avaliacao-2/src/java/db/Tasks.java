/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

/**
 *
 * @author isabe
 */
public class Tasks {
    private long id;
    private String title;
    private String user;
   
    public Tasks(){
        long id;
        String title;
        String user;
    }
    
    public Tasks(long id, String title, String user){
        this.setTask(id, title, user);
    }
    
    public void setTask(long id, String title, String user){
        this.setId(id);
        this.setTitle(title);
        this.setUser(user);
    }
    
    
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }
    
    
    
}
