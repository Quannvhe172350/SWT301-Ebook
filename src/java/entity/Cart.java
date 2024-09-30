/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author acer
 */
public class Cart {
        private int cartId;
        private int bookId;
        private int userId;
        private double listPrice;
        private String bookName;
        private String author;
        private int quantity;

    public Cart( int bookId,String bookName, String author,double listPrice, int quantity) {
        this.bookId=bookId;
        this.listPrice = listPrice;
        this.bookName = bookName;
        this.author = author;
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Cart{" + "cartId=" + cartId + ", bookId=" + bookId + ", userId=" + userId + ", listPrice=" + listPrice + ", bookName=" + bookName + ", author=" + author + ", quantity=" + quantity + '}';
    }



    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Cart(int bookId, int userId, double listPrice, String bookName, String author) {
        this.bookId = bookId;
        this.userId = userId;
        this.listPrice = listPrice;
        this.bookName = bookName;
        this.author = author;
    }

    public Cart() {
        
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public double getListPrice() {
        return listPrice;
    }

    public void setListPrice(double listPrice) {
        this.listPrice = listPrice;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }
        
        
}
 