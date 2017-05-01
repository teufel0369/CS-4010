//University of Missouri has the right to use this code for educational purposes

package victoriousBrewing;

import com.google.gson.stream.JsonReader;
import org.json.simple.*;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import java.io.*;
import java.util.Iterator;
import java.util.*;
import com.google.gson.*;
import com.google.gson.reflect.*;
import java.lang.reflect.*;

public class InvoiceDB {
    private static final Type INVOICE_TYPE = new TypeToken<ArrayList<Invoice>>() {}.getType();

    public static synchronized void insertInvoice(Invoice invoice, Cart cart) throws IOException, ParseException {

        ArrayList<Invoice> list = getInvoices();
        list.add(invoice);

        try (Writer writer = new FileWriter("/usr/share/tomcat/webapps/j-thompson/InvoiceDB.json")) {
            Gson gson = new GsonBuilder().create();
            gson.toJson(list, writer);
        }
    }

    public static synchronized ArrayList<Invoice> getInvoices() throws FileNotFoundException {
        Invoice invoice = null;
        Gson gson = new Gson();
        JsonReader reader = new JsonReader(new FileReader("/usr/share/tomcat/webapps/j-thompson/InvoiceDB.json"));
        ArrayList<Invoice> list = gson.fromJson(reader, INVOICE_TYPE);

        return list;
    }
}
