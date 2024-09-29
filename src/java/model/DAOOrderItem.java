/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.OrderItem;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

/**
 *
 * @author acer
 */
public class DAOOrderItem extends DBConnect {

    public int createOrderItem(OrderItem orderItem) {
        String insertOrderItemQuery = "INSERT INTO orderitem (orderid, itemid, bookid, listprice, quantity) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement pre;
        try {
            pre = conn.prepareStatement(insertOrderItemQuery);
            int nextItemId = getNextItemId(orderItem.getOrderId());

            pre.setInt(1, orderItem.getOrderId());
            pre.setInt(2, nextItemId);
            pre.setInt(3, orderItem.getBookId());
            pre.setDouble(4, orderItem.getListPrice());
            pre.setInt(5, orderItem.getQuantity());

            // Execute the insert statement
            pre.executeUpdate();

            // Return the manually generated item ID
            return nextItemId;
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception appropriately, e.g., log it or throw a custom exception
            return -1; // Return a sentinel value indicating failure
        }
    }

    private int getNextItemId(int orderId) throws SQLException {
        String getMaxItemIdQuery = "SELECT MAX(itemid) FROM orderitem WHERE orderid = ?";
        PreparedStatement pre;
        pre = conn.prepareStatement(getMaxItemIdQuery);
        pre.setInt(1, orderId);
        ResultSet resultSet = pre.executeQuery();

        if (resultSet.next()) {
            int maxItemId = resultSet.getInt(1);
            return maxItemId + 1;
        } else {
            // No existing records in the order, start with item ID 1
            return 1;
        }
    }

}
