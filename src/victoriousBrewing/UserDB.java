//University of Missouri has the right to use this code for educational purposes

package victoriousBrewing;

import org.json.simple.*;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import java.io.*;
import java.util.Iterator;
import java.util.Objects;


public class UserDB {

    public static synchronized void insertUser(User user) throws IOException, ParseException {

        JSONParser parser = new JSONParser();
        Object obj = parser.parse(new FileReader("/UserDB.json"));
        JSONObject jsonObject = (JSONObject) obj;

        //get the credentials for the user
        String firstName = user.getFirstName();
        String lastName = user.getLastName();
        String email = user.getEmail();

        JSONObject newJSON = new JSONObject();

        //put all the credentials from the user object into the json object
        newJSON.put("firstName", firstName);
        newJSON.put("lastName", lastName);
        newJSON.put("email", email);

        appendToList(jsonObject, newJSON); //append those credentials to the JSON array

        try(FileWriter file = new FileWriter("/classes/Java/j-thompson/tomcat/UserDB.json")){
            file.write(jsonObject.toJSONString()); //write the object to the file
            file.flush(); //flush the FileWriter buffer
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }


    public static boolean verifyUser(User user){
        boolean flag = false;

        JSONParser parser = new JSONParser(); //instantiate a json parser

        try{
            Object obj = parser.parse(new FileReader("/usr/share/tomcat/webapps/j-thompson/UserDB.json")); //parse the file
            JSONObject jsonObject = (JSONObject) obj; //make an object out the parsed file
            JSONArray users = (JSONArray) jsonObject.get("users"); //get the array of users
            Iterator it = users.iterator(); //iterator for the array
            String userEmail = user.getEmail(); //get the user email

            while(it.hasNext()){ //while there are multiple users
                JSONObject slide = (JSONObject) it.next(); //iterate to the next user
                String dbEmail = (String) slide.get("email"); //get the email from the json file

                if(userEmail.equals(dbEmail)){ //compare that email to the user email
                    flag = true; //if it exists, set the flag to true
                }
                else{
                    flag = false; //otherwise set it to false
                }
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }

        return flag;
    }

    private static void appendToList(JSONObject jsonObject, JSONObject toBeAppended){
        JSONArray arr = (JSONArray) jsonObject.get("users");
        arr.add(toBeAppended);
    }
}
