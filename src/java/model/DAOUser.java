/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.User;
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
public class DAOUser extends DBConnect {

    public int userRegister(User user) {
        int n = 0;
        PreparedStatement pre;
        String sql = "INSERT INTO [users]\n"
                + "           ([name]\n"
                + "           ,[email]\n"
                + "           ,[phonenumber]\n"
                + "           ,[password])\n"
                + "     VALUES(?,?,?,?)";
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, user.getName());
            pre.setString(2, user.getEmail());
            pre.setString(3, user.getPhonenumber());
            pre.setString(4, user.getPassword());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            System.out.print(ex.getMessage());
        }
        return n;
    }

    public User login(String email, String password) {
        PreparedStatement pre;
        String sql = "select * from users where email = ? and password = ?";
        User user = null;
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, email);
            pre.setString(2, password);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String pass = rs.getString(3);
                String phone = rs.getString(4);
                String address = rs.getString(5);
                String landmark = rs.getString(6);
                String city = rs.getString(7);
                String state = rs.getString(8);
                String pincode = rs.getString(9);
                String mail = rs.getString(10);

                // Create a Customer object and add it to the vector
                user = new User(id, name, pass, phone, address, landmark, city,
                        state, pincode, mail);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }

    public User getUserById(int id) {
        User user = null;
        String sql = "select * from users where id=?";
        PreparedStatement pre;
        try {
            pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int userid = rs.getInt(1);
                String name = rs.getString(2);
                String pass = rs.getString(3);
                String phone = rs.getString(4);
                String address = rs.getString(5);
                String landmark = rs.getString(6);
                String city = rs.getString(7);
                String state = rs.getString(8);
                String pincode = rs.getString(9);
                String mail = rs.getString(10);
                user = new User(userid, name, pass, phone, address, landmark, city,
                        state, pincode, mail);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }

    public Vector<User> getAllUsers(String sql) {
        Vector<User> vector = new Vector<User>();
        Statement statement;
        try {
            statement = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String pass = rs.getString(3);
                String phone = rs.getString(4);
                String address = rs.getString(5);
                String landmark = rs.getString(6);
                String city = rs.getString(7);
                String state = rs.getString(8);
                String pincode = rs.getString(9);
                String mail = rs.getString(10);

                // Create a Customer object and add it to the vector
                User user = new User(id, name, pass, phone, address, landmark, city,
                        state, pincode, mail);
                vector.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOBook.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public int editAddress(User user) {
        int n = 0;
        PreparedStatement pre;
        String sql = "UPDATE users\n"
                + "SET address = ?,\n"
                + "    landmark = ?,\n"
                + "    city = ?,\n"
                + "    state = ?,\n"
                + "    pincode = ?\n"
                + "WHERE id = ?";
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, user.getAddress());
            pre.setString(2, user.getLandmark());
            pre.setString(3, user.getCity());
            pre.setString(4, user.getState());
            pre.setString(5, user.getPincode());
            pre.setInt(6, user.getId());

            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOBook.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int editUser(User user) {
        int n = 0;
        PreparedStatement pre;
        String sql = "UPDATE users\n"
                + "SET name = ?,\n"
                + "    password = ?,\n"
                + "    phonenumber = ?,\n"
                + "    address = ?,\n"
                + "    landmark = ?,\n"
                + "    city = ?,\n"
                + "    state = ?,\n"
                + "    pincode = ?,\n"
                + "    email = ?\n"
                + "WHERE id = ?";
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, user.getName());
            pre.setString(2, user.getPassword());
            pre.setString(3, user.getPhonenumber());
            pre.setString(4, user.getAddress());
            pre.setString(5, user.getLandmark());
            pre.setString(6, user.getCity());
            pre.setString(7, user.getState());
            pre.setString(8, user.getPincode());
            pre.setString(9, user.getEmail());
            pre.setInt(10, user.getId());

            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOBook.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int deleteUser(int id) {
        int n = 0;
        String sql = "delete from users where id=" + id;
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return n;
    }

    public int checkUser(String email) {
        int n = 0;
        String sql = "SELECT * FROM users WHERE email = ?";
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, email);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                // User with the given email exists
                n = 1;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return n;
    }

    public int checkUserPassword(int id,String password) {
        int n = 0;
        String sql = "SELECT * FROM users WHERE id = ? and password = ?";
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                // User with the given email exists
                n = 1;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return n;
    }
    public int setPassword(int id,String password) {
        int n = 0;
        PreparedStatement pre;
        String sql = "UPDATE users\n"
                + "SET password = ?\n"
                + "WHERE id = ?";
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, password);
            pre.setInt(2, id);

            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOBook.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
}
