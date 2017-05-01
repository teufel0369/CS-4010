//University of Missouri has the right to use this code for educational purposes

package victoriousBrewing;

import java.io.*;

public class Volunteer {
    String firstName;
    String lastName;
    String email;
    String status;

    public Volunteer(){
        firstName = "";
        lastName = "";
        email = "";
        status = "";
    }

    public Volunteer(String firstName, String lastName, String email, String status){
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.status = status;
    }

    public String getFirstName(){ return firstName; }
    public String getLastName(){ return lastName; }
    public String getEmail(){ return email; }
    public String getStatus(){ return status; }
}
