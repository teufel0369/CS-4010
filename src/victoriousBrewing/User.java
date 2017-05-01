//University of Missouri has the right to use this code for educational purposes

package victoriousBrewing;

import java.io.*;

public class User implements Serializable{
    private String firstName;
    private String lastName;
    private String email;

    public User(){
        firstName = "";
        lastName = "";
        email = "";
    }

    //constructor to set user attributes
    public User(String first, String last, String email){
        this.firstName = first;
        this.lastName = last;
        this.email = email;
    }

    public String getFirstName(){
        return firstName;
    }

    public String getLastName(){
        return lastName;
    }

    public String getEmail(){
        return email;
    }

    public void setFirstName(String firstName){
        this.firstName = firstName;
    }

    public void setLastName(String lastName){
        this.lastName = lastName;
    }

    public void setEmail(String email){
        this.email = email;
    }
}