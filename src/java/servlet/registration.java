/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.HibernateUtil;
import model.User;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author USER
 */
public class registration extends HttpServlet {

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
       
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        int balance = Integer.parseInt(request.getParameter("balance"));
        
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        User user = new User();
        user.setUsername(username);
        user.setBalance(balance);
        user.setPassword(password);
        List<User>users = null;
        Criteria crit = s.createCriteria(User.class);
        int count = 0;
        try{
            tx = s.beginTransaction();
            
            users = (List<User>)crit.list();
            
             for(User u : users){
                if(username.equals(u.getUsername())){
                count++;
            }
        }
            if(count == 0){
                s.save(user);
            
                HttpSession session = request.getSession();
                session.setAttribute("logged", "1");
                session.setAttribute("status", user.getStatus());
                session.setAttribute("user_id", user.getId());
                tx.commit();
                response.sendRedirect("glavna.jsp");
             }else{
                response.sendRedirect("registracija.jsp");
        }
            
            
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
