package ca.sait.lab6crud.models;

import java.io.Serializable;

/**
 * Represents a role
 * @author Alan(Dong O) Kim
 */
public class Role implements Serializable{
    private int id;         // role_id
    private String name;    // role_name
    
    public Role() {
        
    }
    
    public Role(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
