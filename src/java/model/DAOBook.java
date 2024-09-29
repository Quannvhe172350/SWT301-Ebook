/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Book;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author acer
 */
public class DAOBook extends DBConnect {

    public int AddBook(Book book) {
        int n = 0;
        PreparedStatement pre;
        String sql = "INSERT INTO [books]\n"
                + "           ([bookName]\n"
                + "           ,[author]\n"
                + "           ,[price]\n"
                + "           ,[bookCategory]\n"
                + "           ,[status]\n"
                + "           ,[photo]\n"
                + "           ,[email])\n"
                + "     VALUES(?,?,?,?,?,?,?)";
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, book.getBookName());
            pre.setString(2, book.getAuthor());
            pre.setDouble(3, book.getPrice());
            pre.setString(4, book.getBookCategory());
            pre.setString(5, book.getStatus());
            pre.setString(6, book.getPhoto());
            pre.setString(7, book.getEmail());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            System.out.print(ex.getMessage());
        }
        return n;
    }

    public Vector<Book> getAllBooks(String sql) {
        Vector<Book> vector = new Vector<>();
        Statement state;
        try {
            state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int bookId = rs.getInt(1);
                String bookname = rs.getString(2);
                String author = rs.getString(3);
                double price = rs.getDouble(4);
                String bookCategory = rs.getString(5);
                String status = rs.getString(6);
                String img = rs.getString(7);
                String email = rs.getString(8);
                Book book = new Book(bookId, bookname, author, price, bookCategory, status, img, email);
                vector.add(book);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOBook.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public Book getBookById(int id) {
        Book book = null;
        String sql = "select * from books where bookId = ?";
        PreparedStatement pre;
        try {
            pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int bookId = rs.getInt(1);
                String bookname = rs.getString(2);
                String author = rs.getString(3);
                double price = rs.getDouble(4);
                String bookCategory = rs.getString(5);
                String status = rs.getString(6);
                String img = rs.getString(7);
                String email = rs.getString(8);
                book = new Book(bookId, bookname, author, price, bookCategory, status, img, email);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOBook.class.getName()).log(Level.SEVERE, null, ex);
        }
        return book;
    }

    public Vector<Book> getBookBySearch(String search) {
        Vector<Book> vector = new Vector<>();
        String sql = "select * from books where bookName LIKE ? OR author LIKE ? OR bookCategory LIKE ? AND status = ?";
        PreparedStatement pre;
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, "%" + search + "%");
            pre.setString(2, "%" + search + "%");
            pre.setString(3, "%" + search + "%");
            pre.setString(4, "Active");
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int bookId = rs.getInt(1);
                String bookname = rs.getString(2);
                String author = rs.getString(3);
                double price = rs.getDouble(4);
                String bookCategory = rs.getString(5);
                String status = rs.getString(6);
                String img = rs.getString(7);
                String email = rs.getString(8);
                Book book = new Book(bookId, bookname, author, price, bookCategory, status, img, email);
                vector.add(book);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOBook.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public Vector<Book> getBookByPrice(String priceRange) {
        Vector<Book> vector = new Vector<>();
        String sql = "select * from books where price >= ? AND price <=?";
        PreparedStatement pre;
        double minPrice = 0;
        double maxPrice = Double.MAX_VALUE;
        switch (priceRange) {
            case "0-100":
                maxPrice = 100;
                break;
            case "100-200":
                minPrice = 100;
                maxPrice = 200;
                break;
            case "200-300":
                minPrice = 200;
                maxPrice = 300;
                break;
            case "300+":
                minPrice = 300;
                break;
            default:
            // Invalid price range
        }
        try {
            pre = conn.prepareStatement(sql);
            pre.setDouble(1, minPrice);
            pre.setDouble(2, maxPrice);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int bookId = rs.getInt(1);
                String bookname = rs.getString(2);
                String author = rs.getString(3);
                double price = rs.getDouble(4);
                String bookCategory = rs.getString(5);
                String status = rs.getString(6);
                String img = rs.getString(7);
                String email = rs.getString(8);
                Book book = new Book(bookId, bookname, author, price, bookCategory, status, img, email);
                vector.add(book);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOBook.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
    

    public Vector<Book> getOldBook(String email, String cate) {
        Vector<Book> vector = new Vector<Book>();
        String sql = "select * from books where bookCategory = ? and email = ?";
        PreparedStatement pre;
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, cate);
            pre.setString(2, email);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int bookId = rs.getInt(1);
                String bookname = rs.getString(2);
                String author = rs.getString(3);
                double price = rs.getDouble(4);
                String bookCategory = rs.getString(5);
                String status = rs.getString(6);
                String img = rs.getString(7);
                String mail = rs.getString(8);
                Book book = new Book(bookId, bookname, author, price, bookCategory, status, img, mail);
                vector.add(book);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOBook.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public int editBook(Book book) {
        int n = 0;
        PreparedStatement pre;
        String sql = "UPDATE books\n"
                + "SET bookName = ?,\n"
                + "    author = ?,\n"
                + "    price = ?,\n"
                + "    status = ?\n"
                + "WHERE bookId = ?";
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, book.getBookName());
            pre.setString(2, book.getAuthor());
            pre.setDouble(3, book.getPrice());
            pre.setString(4, book.getStatus());
            pre.setInt(5, book.getBookId());

            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOBook.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int deleteBook(int id) {
        int n = 0;
        String sql = "delete from books where bookId=" + id;
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return n;
    }

    public int deleteBook(String email, int id) {
        int n = 0;
        String sql = "DELETE FROM books WHERE bookId = ? AND email = ?";
        try (PreparedStatement preparedStatement = conn.prepareStatement(sql)) {
            preparedStatement.setInt(1, id);
            preparedStatement.setString(2, email);
            n = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return n;
    }

    public Vector<Book> getNewBook() {
        Book book = null;
        String sql = "Select * from books where bookCategory = ? and status = ?";
        Vector<Book> vector = new Vector<Book>();
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, "New");
            st.setString(2, "Active");
            ResultSet rs = st.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                int bookId = rs.getInt(1);
                String bookname = rs.getString(2);
                String author = rs.getString(3);
                double price = rs.getDouble(4);
                String bookCategory = rs.getString(5);
                String status = rs.getString(6);
                String img = rs.getString(7);
                String email = rs.getString(8);
                book = new Book(bookId, bookname, author, price, bookCategory, status, img, email);
                vector.add(book);
                i++;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return vector;
    }

    public Vector<Book> getAllNewBook() {
        Book book = null;
        String sql = "Select * from books where bookCategory = ? and status = ?";
        Vector<Book> vector = new Vector<Book>();
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, "New");
            st.setString(2, "Active");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int bookId = rs.getInt(1);
                String bookname = rs.getString(2);
                String author = rs.getString(3);
                double price = rs.getDouble(4);
                String bookCategory = rs.getString(5);
                String status = rs.getString(6);
                String img = rs.getString(7);
                String email = rs.getString(8);
                book = new Book(bookId, bookname, author, price, bookCategory, status, img, email);
                vector.add(book);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return vector;
    }

    public Vector<Book> getRecentBook() {
        Book book = null;
        String sql = "Select * from books where status = ? order by bookId DESC";
        Vector<Book> vector = new Vector<Book>();
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, "Active");
            ResultSet rs = st.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                int bookId = rs.getInt(1);
                String bookname = rs.getString(2);
                String author = rs.getString(3);
                double price = rs.getDouble(4);
                String bookCategory = rs.getString(5);
                String status = rs.getString(6);
                String img = rs.getString(7);
                String email = rs.getString(8);
                book = new Book(bookId, bookname, author, price, bookCategory, status, img, email);
                vector.add(book);
                i++;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return vector;
    }

    public Vector<Book> getAllRecentBook() {
        Book book = null;
        String sql = "Select * from books where status = ? order by bookId DESC";
        Vector<Book> vector = new Vector<Book>();
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, "Active");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int bookId = rs.getInt(1);
                String bookname = rs.getString(2);
                String author = rs.getString(3);
                double price = rs.getDouble(4);
                String bookCategory = rs.getString(5);
                String status = rs.getString(6);
                String img = rs.getString(7);
                String email = rs.getString(8);
                book = new Book(bookId, bookname, author, price, bookCategory, status, img, email);
                vector.add(book);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return vector;
    }

    public Vector<Book> getOldBook() {
        Book book = null;
        String sql = "Select * from books where bookCategory = ? and status = ?";
        Vector<Book> vector = new Vector<Book>();
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, "Old");
            st.setString(2, "Active");
            ResultSet rs = st.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                int bookId = rs.getInt(1);
                String bookname = rs.getString(2);
                String author = rs.getString(3);
                double price = rs.getDouble(4);
                String bookCategory = rs.getString(5);
                String status = rs.getString(6);
                String img = rs.getString(7);
                String email = rs.getString(8);
                book = new Book(bookId, bookname, author, price, bookCategory, status, img, email);
                vector.add(book);
                i++;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return vector;
    }

    public Vector<Book> getAllOldBook() {
        Book book = null;
        String sql = "Select * from books where bookCategory = ? and status = ?";
        Vector<Book> vector = new Vector<Book>();
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, "Old");
            st.setString(2, "Active");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int bookId = rs.getInt(1);
                String bookname = rs.getString(2);
                String author = rs.getString(3);
                double price = rs.getDouble(4);
                String bookCategory = rs.getString(5);
                String status = rs.getString(6);
                String img = rs.getString(7);
                String email = rs.getString(8);
                book = new Book(bookId, bookname, author, price, bookCategory, status, img, email);
                vector.add(book);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return vector;
    }

}
