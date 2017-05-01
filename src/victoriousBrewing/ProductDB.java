//University of Missouri has the right to use this code for educational purposes

package victoriousBrewing;

import org.json.simple.*;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import java.io.*;
import java.util.Iterator;
import java.util.Objects;

public class ProductDB {

    public static synchronized Product getProduct(String productCode) throws IOException, ParseException {
        JSONParser parser = new JSONParser();
        JSONObject jsonObject = (JSONObject) parser.parse(new FileReader("/Users/magnificentbastard/IdeaProjects/Store/web/ProductDB.json"));
        JSONArray productArray = (JSONArray) jsonObject.get("productArray");
        Iterator it = productArray.iterator();
        String productDescription = "";
        String productPrice = "";
        String testCase = "";

        while(it.hasNext()){
            JSONObject element = (JSONObject) it.next();
            testCase = (String) element.get("productCode");

            if(productCode.equals(testCase)){ //if the product code
                productDescription = (String) element.get("productDescription");
                System.out.println(productDescription); //***Debugging only
                productPrice = (String) element.get("productPrice");
                System.out.println(productPrice); //***Debugging only
            }
        }

        double price = Double.parseDouble(productPrice);

        Product product = new Product(productCode, productDescription, price);

        return product;
    }
}
