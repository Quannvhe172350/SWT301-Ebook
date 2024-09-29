/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Cart;
import entity.Order;
import entity.OrderItem;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Enumeration;
import model.DAOOrder;
import model.DAOOrderItem;

/**
 *
 * @author acer
 */
@WebServlet(name = "OrderServlet", urlPatterns = {"/order"})
public class OrderServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession(false);
            String address = request.getParameter("address");
            String landmark = request.getParameter("landmark");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String zipcode = request.getParameter("pincode");
            String fulladd = address + " " + landmark + " " + city + " " + state + " " + zipcode;
            String payment = request.getParameter("payment"); // Corrected parameter name
            String mess="";
            if (session != null) {
                User user = (User) session.getAttribute("userobj");
                if (user != null) {
                    DAOOrder dao = new DAOOrder();
                    Order o = new Order();
                    o.setUserId(user.getId());
                    o.setFullAddress(fulladd);
                    o.setPaymentMethod(payment);
                    int orderId = dao.createOrder(o);

                    if (orderId > 0) {
                        int maxOrderId = dao.getMaxOrderId(); // Retrieve max order ID after creating the order

                        Enumeration<String> keys = session.getAttributeNames();
                        while (keys.hasMoreElements()) {
                            String key = keys.nextElement();
                            if (!key.equals("userobj") && !key.equals("admin")) {
                                Cart cartItem = (Cart) session.getAttribute(key);
                                OrderItem orderItem = new OrderItem();
                                orderItem.setOrderId(maxOrderId); // Use the retrieved max order ID
                                orderItem.setBookId(cartItem.getBookId());
                                orderItem.setQuantity(cartItem.getQuantity());
                                orderItem.setListPrice(cartItem.getList_price());
                                DAOOrderItem dao2 = new DAOOrderItem();
                                dao2.createOrderItem(orderItem);
                                session.removeAttribute(key);
                            }
                        }
                        mess = "Add Successfully";
                        response.sendRedirect("displayorder.jsp?message="+mess);
                    } else {
                        mess = "Something On Server";
                        response.sendRedirect("displayorder.jsp?message="+mess);
                    }
                }
            }
        }

    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
/**
 * Handles the HTTP <code>GET</code> method.
 *
 * @param request servlet request
 * @param response servlet response
 * @throws ServletException if a servlet-specific error occurs
 * @throws IOException if an I/O error occurs
 */
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
