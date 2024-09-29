/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.Date;

/**
 *
 * @author acer
 */
public class Order {
    private int orderId;
    private int userId;
    private Date orderDate;
    private String fullAddress;
    private String paymentMethod;
    private int orderStatus;

    public Order(int orderId, int userId, Date orderDate, String fullAddress, String paymentMethod, int orderStatus) {
        this.orderId = orderId;
        this.userId = userId;
        this.orderDate = orderDate;
        this.fullAddress = fullAddress;
        this.paymentMethod = paymentMethod;
        this.orderStatus = orderStatus;
    }

    public int getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(int orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Order() {
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getFullAddress() {
        return fullAddress;
    }

    public void setFullAddress(String fullAddress) {
        this.fullAddress = fullAddress;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public Order(int orderId, int userId, Date orderDate, String fullAddress, String paymentMethod) {
        this.orderId = orderId;
        this.userId = userId;
        this.orderDate = orderDate;
        this.fullAddress = fullAddress;
        this.paymentMethod = paymentMethod;
    }
    
    
    
}
