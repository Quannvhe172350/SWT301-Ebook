/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author acer
 */
public class DBConnect {

    Connection conn = null;

    public DBConnect() {
        this("jdbc:sqlserver://localhost:1433;databaseName=EBook", "sa", "sa");
    }

    public DBConnect(String url, String name, String password) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=EBook", "sa", "sa");
            System.out.print("connected");
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBConnect.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet getResultSet(String sql) {
        ResultSet rs = null;
        Statement state;
        try {
            state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            rs = state.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DBConnect.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public static void main(String[] args) {
    // In your main method, you can create instances of your DAOUser and User classes
    DAOUser dao = new DAOUser();
    User user = new User(); // Create a User object with the required data

    // Set user data, for example:
    user.setId(1);
    user.setName("John Doe");
    user.setPassword("password123");
    user.setPhonenumber("1234567890");
    user.setAddress("123 Main St");
    user.setLandmark("Near Park");
    user.setCity("CityName");
    user.setState("StateName");
    user.setPincode("12345");
    user.setEmail("johndoe@example.com");

    // Call the editUser method to update the user's information
    int result = dao.editUser(user);

    if (result > 0) {
        System.out.println("User updated successfully.");
    } else {
        System.out.println("User update failed.");
    }
}

}
