/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.HibernateUtil;
import model.Product;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author USER
 */
public class changeData extends HttpServlet {

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
       
     Product p = null;
     HttpSession session = request.getSession();
     if(session.getAttribute("product") != null){
        p = (Product)session.getAttribute("product");
    }
     String name = request.getParameter("name");
     String type = request.getParameter("type");
     int count = Integer.parseInt(request.getParameter("count"));
     int price = Integer.parseInt(request.getParameter("price"));
     String caliber = request.getParameter("caliber");
     
     Session s = HibernateUtil.getSessionFactory().openSession();
     Transaction tx = null;
     
     try{
         tx = s.beginTransaction();
         
         Product pr = (Product)s.get(Product.class, p.getId());
         pr.setName(name);
         pr.setCaliber(caliber);
         pr.setCount(count);
         pr.setPrice(price);
         pr.setType(type);
         s.update(pr);
         
         tx.commit();
         session.setAttribute("product", pr);
         response.sendRedirect("productInfo.jsp");
     }catch(Exception ex){
         if(tx != null){
             tx.rollback();
         }
         ex.printStackTrace();
     }finally{
         s.close();
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
