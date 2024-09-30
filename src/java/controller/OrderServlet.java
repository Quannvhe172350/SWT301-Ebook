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
    try (PrintWriter out = response.getWriter()) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            User user = (User) session.getAttribute("userobj");
            if (user != null) {
                String fulladd = getFullAddress(request);
                String payment = request.getParameter("payment");
                int orderId = createOrder( user, fulladd, payment);
                
                if (orderId > 0) {
                    handleCartItems(session, orderId);
                    redirectWithMessage(response, "Add Successfully", "displayorder.jsp");
                } else {
                    redirectWithMessage(response, "Something On Server", "displayorder.jsp");
                }
            }
        }
    }
}

private String getFullAddress(HttpServletRequest request) {
    String address = request.getParameter("address");
    String landmark = request.getParameter("landmark");
    String city = request.getParameter("city");
    String state = request.getParameter("state");
    String zipcode = request.getParameter("pincode");
    return address + " " + landmark + " " + city + " " + state + " " + zipcode;
}

private int createOrder( User user, String fulladd, String payment) {
    DAOOrder dao = new DAOOrder();
    Order o = new Order();
    o.setUserId(user.getId());
    o.setFullAddress(fulladd);
    o.setPaymentMethod(payment);
    return dao.createOrder(o);
}

private void handleCartItems(HttpSession session, int orderId) {
    DAOOrderItem dao2 = new DAOOrderItem();
    Enumeration<String> keys = session.getAttributeNames();
    while (keys.hasMoreElements()) {
        String key = keys.nextElement();
        if (!key.equals("userobj") && !key.equals("admin")) {
            Cart cartItem = (Cart) session.getAttribute(key);
            OrderItem orderItem = new OrderItem();
            orderItem.setOrderId(orderId);
            orderItem.setBookId(cartItem.getBookId());
            orderItem.setQuantity(cartItem.getQuantity());
            orderItem.setListPrice(cartItem.getListPrice());
            dao2.createOrderItem(orderItem);
            session.removeAttribute(key);
        }
    }
}

private void redirectWithMessage(HttpServletResponse response, String message, String redirectPage) throws IOException {
    response.sendRedirect(redirectPage + "?message=" + message);
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
