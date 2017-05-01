//University of Missouri has the right to use this code for educational purposes

package victoriousBrewing;

import java.io.*;
import java.text.NumberFormat;

public class Product implements Serializable{

    private String productCode;
    private String productDescription;
    private double price;

    Product(){
        this.productCode = "";
        this.productDescription = "";
        this.price = 0.00;
    }

    Product(String productCode, String productDescription, double price){
        this.productCode = productCode;
        this.productDescription = productDescription;
        this.price = price;
    }

    public void setProductCode(String productCode){
        this.productCode = productCode;
    }

    public void setProductDescription(String productDescription){
        this.productDescription = productDescription;
    }

    public void setPrice(double price){
        this.price = price;
    }

    public String getProductCode(){ return productCode; }
    public String getProductDescription(){ return productDescription; }
    public double getPrice(){ return price; }
    public String getPriceCurrencyFormat(){
        NumberFormat currency = NumberFormat.getCurrencyInstance();
        return currency.format(price);
    }
}