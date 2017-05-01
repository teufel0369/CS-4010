//University of Missouri has the right to use this code for educational purposes

package victoriousBrewing;

import javax.sound.sampled.Line;
import java.io.Serializable;
import java.util.ArrayList;
import java.text.NumberFormat;

public class Cart implements Serializable{

    private ArrayList<LineItem> items;

    public Cart(){
        items = new ArrayList<LineItem>();
    }

    public ArrayList<LineItem> getItems(){
        return items;
    }

    public int getCount(){
        return items.size();
    }

    public synchronized void addItem(LineItem item){
        String code = item.getProduct().getProductCode(); //get the product code from the line item
        int quantity = item.getQuantity(); //get the quantity, which will usually always be 1, but

        for(LineItem i : items){ //for each item in the items list
            if(i.getProduct().getProductCode().equals(code)){ //if
                i.setQuantity(i.getQuantity() + quantity);
                return;
            }
        }
        items.add(item);
    }

    public synchronized void removeItem(String productCode){

        for(LineItem i : items){
           if(i.getProduct().getProductCode().equals(productCode)){
               items.remove(i);
               return;
           }
       }
    }

    public synchronized void updateCart(String productCode, int quantity){

        for(LineItem i : items){
            if(i.getProduct().getProductCode().equals(productCode)){
                i.setQuantity(quantity);
                return;
            }
        }
    }

    public String getCartTotal(){
        String val = new String("");
        double parseVal = 0.00;

        for(LineItem i : items){
            parseVal += i.getTotal();
        }

        NumberFormat currency = NumberFormat.getCurrencyInstance();

        return currency.format(parseVal);
    }

    public String getTaxTotal(){
        double parseVal = 0.00;

        for(LineItem i : items){
            parseVal += i.getTotal();
        }

        double tax = parseVal * 0.0735;

        NumberFormat currency = NumberFormat.getCurrencyInstance();
        return currency.format(tax);
    }

    public String getShippingTotal(){
        double val = 0.00;

        for(LineItem i : items){
            val += i.getTotal();
        }

        double tax = val * 0.20;

        NumberFormat currency = NumberFormat.getCurrencyInstance();
        return currency.format(tax);
    }

    public synchronized String getFinalTotal(){
        double value = 0.00;

        for(LineItem i : items){
            value += i.getTotal();
        }

        double total = (value * 0.2) + (value * 0.0735) + value;

        NumberFormat currency = NumberFormat.getCurrencyInstance();
        return currency.format(total);
    }
}
