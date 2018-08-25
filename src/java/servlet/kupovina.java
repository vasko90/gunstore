/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.HibernateUtil;
import model.Product;
import model.Transakcija;
import model.User;
import model.Weapon;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author USER
 */
public class kupovina extends HttpServlet {

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
       
        int userId = (Integer)request.getSession().getAttribute("user_id");
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        Criteria user = s.createCriteria(User.class);
        user.add(Restrictions.eq("id", userId));
        int suma = 0;
        User u = null;
        
        
        for(Product p : Weapon.products){
            suma += p.getPrice();
        }
        
        try{
            tx = s.beginTransaction();
            
            u = (User)user.uniqueResult();
            
            tx.commit();
            
            if(suma > u.getBalance()){
            response.sendRedirect("warning.jsp");
        }else{
                Iterator iter = Weapon.products.iterator();
                while(iter.hasNext()){
                    Product p = (Product) iter.next();
                    Criteria cr = s.createCriteria(Product.class);
                    cr.add(Restrictions.eq("id", p.getId()));
                    
                    tx = s.beginTransaction();
                    Product pr = (Product)cr.uniqueResult();
                    
                    if(pr.getCount() > 0){
                    pr.setCount(pr.getCount()-1);
                    u.setBalance(u.getBalance() - pr.getPrice());
                    s.update(pr);
                    s.update(u);
                    iter.remove();
                    Transakcija t = new Transakcija();
                    t.setProducts(pr.getName());
                    t.setSum(pr.getPrice());
                    t.setUser(u);
                    s.save(t);
                    
                    tx.commit();
                    }else{
                        HttpSession session = request.getSession();
                        session.setAttribute("oruzje", pr.getName());
                        response.sendRedirect("empty.jsp");
                    }
                }
                Weapon.products = new ArrayList<>();
                HttpSession session = request.getSession();
                session.setAttribute("korpa/lista", Weapon.products);
                response.sendRedirect("bought.jsp");
            }
        }catch(Exception ex){
            if(tx != null){
                //tx.rollback();
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
