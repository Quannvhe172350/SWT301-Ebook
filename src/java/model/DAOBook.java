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
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author acer
 */
public class DAOBook extends DBConnect {

    public int AddBook(Book book) {
        int n = 0;
        String sql = "INSERT INTO [books]\n"
                + "           ([bookName]\n"
                + "           ,[author]\n"
                + "           ,[price]\n"
                + "           ,[bookCategory]\n"
                + "           ,[status]\n"
                + "           ,[photo]\n"
                + "           ,[email])\n"
                + "     VALUES(?,?,?,?,?,?,?)";
        // Use try-with-resources to ensure PreparedStatement is closed properly
        try (PreparedStatement pre = conn.prepareStatement(sql)) {
            pre.setString(1, book.getBookName());
            pre.setString(2, book.getAuthor());
            pre.setDouble(3, book.getPrice());
            pre.setString(4, book.getBookCategory());
            pre.setString(5, book.getStatus());
            pre.setString(6, book.getPhoto());
            pre.setString(7, book.getEmail());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
           Logger.getLogger(DAOBook.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public List<Book> getAllBooks(String sql) {
        List<Book> vector = new ArrayList<>();
        Statement state;
        try {
            state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                Book book = new Book();
                book.setBookId(rs.getInt(1));           // Thiết lập bookId
                book.setBookName(rs.getString(2));      // Thiết lập bookName
                book.setAuthor(rs.getString(3));        // Thiết lập author
                book.setPrice(rs.getDouble(4));         // Thiết lập price
                book.setBookCategory(rs.getString(5));  // Thiết lập bookCategory
                book.setStatus(rs.getString(6));        // Thiết lập status
                book.setPhoto(rs.getString(7));         // Thiết lập img/photo
                book.setEmail(rs.getString(8));         // Thiết lập email
                vector.add(book);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOBook.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public Book getBookById(int id) {
        Book book = new Book();
        String sql = "select * from books where bookId = ?";
        PreparedStatement pre;
        try {
            pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                book.setBookId(rs.getInt(1));           // Thiết lập bookId
                book.setBookName(rs.getString(2));      // Thiết lập bookName
                book.setAuthor(rs.getString(3));        // Thiết lập author
                book.setPrice(rs.getDouble(4));         // Thiết lập price
                book.setBookCategory(rs.getString(5));  // Thiết lập bookCategory
                book.setStatus(rs.getString(6));        // Thiết lập status
                book.setPhoto(rs.getString(7));         // Thiết lập img/photo
                book.setEmail(rs.getString(8));         // Thiết lập emailF
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOBook.class.getName()).log(Level.SEVERE, null, ex);
        }
        return book;
    }

    public List<Book> getBookBySearch(String search) {
        List<Book> vector = new ArrayList<>();
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
                Book book = new Book();
                book.setBookId(rs.getInt(1));           // Thiết lập bookId
                book.setBookName(rs.getString(2));      // Thiết lập bookName
                book.setAuthor(rs.getString(3));        // Thiết lập author
                book.setPrice(rs.getDouble(4));         // Thiết lập price
                book.setBookCategory(rs.getString(5));  // Thiết lập bookCategory
                book.setStatus(rs.getString(6));        // Thiết lập status
                book.setPhoto(rs.getString(7));         // Thiết lập img/photo
                book.setEmail(rs.getString(8));         // Thiết lập email
                vector.add(book);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOBook.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public List<Book> getBookByPrice(String priceRange) {
        List<Book> vector = new ArrayList<>();
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
                Book book = new Book();
                book.setBookId(rs.getInt(1));           // Thiết lập bookId
                book.setBookName(rs.getString(2));      // Thiết lập bookName
                book.setAuthor(rs.getString(3));        // Thiết lập author
                book.setPrice(rs.getDouble(4));         // Thiết lập price
                book.setBookCategory(rs.getString(5));  // Thiết lập bookCategory
                book.setStatus(rs.getString(6));        // Thiết lập status
                book.setPhoto(rs.getString(7));         // Thiết lập img/photo
                book.setEmail(rs.getString(8));         // Thiết lập email
                vector.add(book);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOBook.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public List<Book> getOldBook(String email, String cate) {
        List<Book> vector = new ArrayList<>();
        String sql = "select * from books where bookCategory = ? and email = ?";
        PreparedStatement pre;
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, cate);
            pre.setString(2, email);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Book book = new Book();
                book.setBookId(rs.getInt(1));           // Thiết lập bookId
                book.setBookName(rs.getString(2));      // Thiết lập bookName
                book.setAuthor(rs.getString(3));        // Thiết lập author
                book.setPrice(rs.getDouble(4));         // Thiết lập price
                book.setBookCategory(rs.getString(5));  // Thiết lập bookCategory
                book.setStatus(rs.getString(6));        // Thiết lập status
                book.setPhoto(rs.getString(7));         // Thiết lập img/photo
                book.setEmail(rs.getString(8));         // Thiết lập email
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
        } catch (SQLException ex) {
            Logger.getLogger(DAOBook.class.getName()).log(Level.SEVERE, null, ex);
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
           Logger.getLogger(DAOBook.class.getName()).log(Level.SEVERE, null, e);
        }
        return n;
    }

    public List<Book> getNewBook() {
        Book book = new Book();
        String sql = "Select * from books where bookCategory = ? and status = ?";
        List<Book> vector = new ArrayList<>();
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, "New");
            st.setString(2, "Active");
            ResultSet rs = st.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                book.setBookId(rs.getInt(1));           // Thiết lập bookId
                book.setBookName(rs.getString(2));      // Thiết lập bookName
                book.setAuthor(rs.getString(3));        // Thiết lập author
                book.setPrice(rs.getDouble(4));         // Thiết lập price
                book.setBookCategory(rs.getString(5));  // Thiết lập bookCategory
                book.setStatus(rs.getString(6));        // Thiết lập status
                book.setPhoto(rs.getString(7));         // Thiết lập img/photo
                book.setEmail(rs.getString(8));         // Thiết lập email
                vector.add(book);
                i++;
            }
        } catch (SQLException e) {
           Logger.getLogger(DAOBook.class.getName()).log(Level.SEVERE, null, e);
        }
        return vector;
    }

    public List<Book> getAllNewBook() {
        Book book = new Book();
        String sql = "Select * from books where bookCategory = ? and status = ?";
        List<Book> vector = new ArrayList<>();
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, "New");
            st.setString(2, "Active");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                book.setBookId(rs.getInt(1));           // Thiết lập bookId
                book.setBookName(rs.getString(2));      // Thiết lập bookName
                book.setAuthor(rs.getString(3));        // Thiết lập author
                book.setPrice(rs.getDouble(4));         // Thiết lập price
                book.setBookCategory(rs.getString(5));  // Thiết lập bookCategory
                book.setStatus(rs.getString(6));        // Thiết lập status
                book.setPhoto(rs.getString(7));         // Thiết lập img/photo
                book.setEmail(rs.getString(8));         // Thiết lập email
                vector.add(book);
            }
        } catch (SQLException e) {
           Logger.getLogger(DAOBook.class.getName()).log(Level.SEVERE, null, e);
        }
        return vector;
    }

    public List<Book> getRecentBook() {
        Book book = new Book();
        String sql = "Select * from books where status = ? order by bookId DESC";
        List<Book> vector = new ArrayList<>();
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, "Active");
            ResultSet rs = st.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                book.setBookId(rs.getInt(1));           // Thiết lập bookId
                book.setBookName(rs.getString(2));      // Thiết lập bookName
                book.setAuthor(rs.getString(3));        // Thiết lập author
                book.setPrice(rs.getDouble(4));         // Thiết lập price
                book.setBookCategory(rs.getString(5));  // Thiết lập bookCategory
                book.setStatus(rs.getString(6));        // Thiết lập status
                book.setPhoto(rs.getString(7));         // Thiết lập img/photo
                book.setEmail(rs.getString(8));         // Thiết lập email
                vector.add(book);
                i++;
            }
        } catch (SQLException e) {
           Logger.getLogger(DAOBook.class.getName()).log(Level.SEVERE, null, e);
        }
        return vector;
    }

    public List<Book> getAllRecentBook() {
        Book book = new Book();
        String sql = "Select * from books where status = ? order by bookId DESC";
        List<Book> vector = new ArrayList<>();
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, "Active");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                book.setBookId(rs.getInt(1));           // Thiết lập bookId
                book.setBookName(rs.getString(2));      // Thiết lập bookName
                book.setAuthor(rs.getString(3));        // Thiết lập author
                book.setPrice(rs.getDouble(4));         // Thiết lập price
                book.setBookCategory(rs.getString(5));  // Thiết lập bookCategory
                book.setStatus(rs.getString(6));        // Thiết lập status
                book.setPhoto(rs.getString(7));         // Thiết lập img/photo
                book.setEmail(rs.getString(8));         // Thiết lập email
                vector.add(book);
            }
        } catch (SQLException e) {
           Logger.getLogger(DAOBook.class.getName()).log(Level.SEVERE, null, e);
        }
        return vector;
    }

    public List<Book> getOldBook() {
        Book book = new Book();
        String sql = "Select * from books where bookCategory = ? and status = ?";
        List<Book> vector = new ArrayList<>();
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, "Old");
            st.setString(2, "Active");
            ResultSet rs = st.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                book.setBookId(rs.getInt(1));           // Thiết lập bookId
                book.setBookName(rs.getString(2));      // Thiết lập bookName
                book.setAuthor(rs.getString(3));        // Thiết lập author
                book.setPrice(rs.getDouble(4));         // Thiết lập price
                book.setBookCategory(rs.getString(5));  // Thiết lập bookCategory
                book.setStatus(rs.getString(6));        // Thiết lập status
                book.setPhoto(rs.getString(7));         // Thiết lập img/photo
                book.setEmail(rs.getString(8));         // Thiết lập email
                vector.add(book);
                i++;
            }
        } catch (SQLException e) {
           Logger.getLogger(DAOBook.class.getName()).log(Level.SEVERE, null, e);
        }
        return vector;
    }

    public List<Book> getAllOldBook() {
        Book book = new Book();
        String sql = "Select * from books where bookCategory = ? and status = ?";
        List<Book> vector = new ArrayList<>();
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, "Old");
            st.setString(2, "Active");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                book.setBookId(rs.getInt(1));           // Thiết lập bookId
                book.setBookName(rs.getString(2));      // Thiết lập bookName
                book.setAuthor(rs.getString(3));        // Thiết lập author
                book.setPrice(rs.getDouble(4));         // Thiết lập price
                book.setBookCategory(rs.getString(5));  // Thiết lập bookCategory
                book.setStatus(rs.getString(6));        // Thiết lập status
                book.setPhoto(rs.getString(7));         // Thiết lập img/photo
                book.setEmail(rs.getString(8));         // Thiết lập email
                vector.add(book);
            }
        } catch (SQLException e) {
           Logger.getLogger(DAOBook.class.getName()).log(Level.SEVERE, null, e);
        }
        return vector;
    }

}
