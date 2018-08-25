/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.HibernateUtil;
import model.Product;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author USER
 */
@MultipartConfig
public class newWeapon extends HttpServlet {

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
       String name = request.getParameter("name");
       String type = request.getParameter("type");
       String caliber = request.getParameter("caliber");
       int price = Integer.parseInt(request.getParameter("price"));
       int count = Integer.parseInt(request.getParameter("count"));
       Part pic = request.getPart("picture");
       String pic_name = UUID.randomUUID().toString() + pic.getSubmittedFileName();
       InputStream is = pic.getInputStream();
       FileOutputStream fos = new FileOutputStream("C:/Users/USER/Documents/NetBeansProjects/GunStore/web/images/" + pic_name);
       int bytes;
       while((bytes = is.read()) != -1){
           fos.write(bytes);
       }
       is.close();
       fos.close();
       
       Product p = new Product();
        p.setName(name);
        p.setCaliber(caliber);
        p.setCount(count);
        p.setPrice(price);
        p.setType(type);
        p.setPicture(pic_name);
        
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        
        try{
            tx = s.beginTransaction();
            
            s.save(p);
            
            tx.commit();
            
            response.sendRedirect("novoOruzje.jsp");
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
