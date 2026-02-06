import java.sql.*;
import java.util.*;

public class Main {
    public static void main(String[] args) {

        String url = "jdbc:mysql://localhost:3306/std";
        String username = "surajpanda";
        String password = "suraj#panda01";

        try {
            // Load Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("Connecting to database...");

            // Create Connection
            Connection connection =
                    DriverManager.getConnection(url, username, password);

            System.out.println("Connected successfully!\n");

            Statement stmt = connection.createStatement();

            // 1️⃣ Number of orders
            ResultSet rs1 = stmt.executeQuery(
                    "SELECT COUNT(*) AS total_orders FROM orders"
            );
            if (rs1.next()) {
                System.out.println("Total Orders: " + rs1.getInt("total_orders"));
            }

            // 2️⃣ Number of customers who ordered
            ResultSet rs2 = stmt.executeQuery(
                    "SELECT COUNT(DISTINCT customer_id) AS total_customers FROM orders"
            );
            if (rs2.next()) {
                System.out.println("Total Customers: " + rs2.getInt("total_customers"));
            }

            // 3️⃣ Customers who ordered which product
            ResultSet rs3 = stmt.executeQuery(
                    "SELECT c.customer_name, p.product_name " +
                            "FROM customers c " +
                            "JOIN orders o ON c.customer_id = o.customer_id " +
                            "JOIN order_items oi ON o.order_id = oi.order_id " +
                            "JOIN products p ON oi.product_id = p.product_id"
            );

            System.out.println("\nCustomer Orders:");
            while (rs3.next()) {
                System.out.println(
                        rs3.getString("customer_name") +
                                " ordered " +
                                rs3.getString("product_name")
                );
            }

            // Close resources
            rs1.close();
            rs2.close();
            rs3.close();
            stmt.close();
            connection.close();

        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
}
