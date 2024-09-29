/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Order;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author acer
 */
public class DAOOrder extends DBConnect {

    public int createOrder(Order order) {
        int n = 0;
        PreparedStatement pre;
        String insertOrderQuery = "INSERT INTO orders (userid, orderdate, fulladdress,paymentmethod,orderstatus) VALUES (?, ?, ?, ?, ?)";
        try {
            pre = conn.prepareStatement(insertOrderQuery);
            pre.setInt(1, order.getUserId());
            // Convert java.util.Date to java.sql.Date
            LocalDate currentDate = LocalDate.now();
            Date utilDate = Date.from(currentDate.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant());
            order.setOrderDate(utilDate);
            java.sql.Date sqlDate = new java.sql.Date(order.getOrderDate().getTime());
            pre.setDate(2, sqlDate);
            pre.setString(3, order.getFullAddress());
            pre.setString(4, order.getPaymentMethod());
            pre.setInt(5, 1);
            n = pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return n;
    }

    public int getMaxOrderId() {
        int maxOrderId = -1; // Initialize to a sentinel value indicating no order ID found

        String query = "SELECT MAX(orderid) AS max_orderid FROM orders";

        try ( PreparedStatement statement = conn.prepareStatement(query);  ResultSet resultSet = statement.executeQuery()) {

            if (resultSet.next()) {
                maxOrderId = resultSet.getInt("max_orderid");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return maxOrderId;
    }

    public Vector<Order> getOrderUser(int id) {
        Vector<Order> vector = new Vector<Order>();
        String sql = "select * from orders where userid = ?";
        PreparedStatement pre;
        try {
            pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int orderid = rs.getInt(1);
                int userid = rs.getInt(1);
                Date orderdate = rs.getDate(3);
                String address = rs.getString(4);
                String paymentmethod = rs.getString(5);
                Order order = new Order(orderid, userid, orderdate, address, paymentmethod);
                vector.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOBook.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public int updateOrderStatus(int orderId, int newStatus) {
        int n = 0;
        PreparedStatement pre;
        String sql = "UPDATE orders SET orderstatus = ? WHERE orderid = ?";
        try {
            pre = conn.prepareStatement(sql);
            pre.setInt(1, newStatus);
            pre.setInt(2, orderId);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOBook.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (n > 0) {
            // Successfully updated the status, return the new status
            return newStatus; // Convert integer status to label (e.g., "wait," "process," "done")
        }
        return 0;
    }

    public boolean deleteOrder(int orderId) {
        int n1 = 0;
        int n2 = 0;
        String sql1 = "delete from orderitem where orderid=" + orderId;
        String sql2 = "delete from orders where orderid=" + orderId;
        try {
            Statement state = conn.createStatement();
            n1 = state.executeUpdate(sql1);
            n2 = state.executeUpdate(sql2);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return n1 > 0 && n2 > 0;
    }
}
