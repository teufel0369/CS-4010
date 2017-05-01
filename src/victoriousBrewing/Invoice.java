//University of Missouri has the right to use this code for educational purposes

package victoriousBrewing;

import java.io.*;
import java.text.NumberFormat;
import java.util.ArrayList;


public class Invoice implements Serializable{
    private String sessionID;
    private String country;
    private String firstName;
    private String lastName;
    private String address;
    private String city;
    private String state;
    private String zip;
    private String phone;
    private String email;
    private String cardType;
    private String cardNumber;
    private String code;
    private String expirationMonth;
    private String expirationYear;
    private ArrayList<LineItem> itemList;
    private String total;

    public Invoice(){
        this.sessionID = "";
        this.country = "";
        this.firstName = "";
        this.lastName = "";
        this.address = "";
        this.city = "";
        this.state = "";
        this.zip = "";
        this.phone = "";
        this.email = "";
        this.cardType = "";
        this.cardNumber = "";
        this.code = "";
        this.expirationMonth = "";
        this.expirationYear = "";
        this.total = "";
        this.itemList = null;

    }



    public Invoice(String sessionID, String country, String firstName, String lastName, String address, String city, String state, String zip,
                   String phone, String email, String cardType, String cardNumber, String code, String expirationMonth,
                   String expirationYear, String total, ArrayList<LineItem> items){

        this.sessionID = sessionID;
        this.country = country;
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
        this.city = city;
        this.state = state;
        this.zip = zip;
        this.phone = phone;
        this.email = email;
        this.cardType = cardType;
        this.cardNumber = cardNumber;
        this.code = code;
        this.expirationMonth = expirationMonth;
        this.expirationYear = expirationYear;
        this.total = total;
        this.itemList = items;
    }

    public String getTotal() {
        return total;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getExpirationMonth() {
        return expirationMonth;
    }

    public void setExpirationMonth(String expirationMonth) {
        this.expirationMonth = expirationMonth;
    }

    public String getExpirationYear() {
        return expirationYear;
    }

    public void setExpirationYear(String expirationYear) {
        this.expirationYear = expirationYear;
    }


    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCardType() {
        return cardType;
    }

    public void setCardType(String cardType) {
        this.cardType = cardType;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public void setItemList(ArrayList<LineItem> items){
        this.itemList = items;
    }

    public ArrayList<LineItem> getItemList(){
        return this.itemList;
    }

    public String getSessionID() { return this.sessionID; }
}
