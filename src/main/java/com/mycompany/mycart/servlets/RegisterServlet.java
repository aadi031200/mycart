 
package com.mycompany.mycart.servlets;

import com.mycompany.mycart.entities.User;
import com.mycompany.mycart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;

 
public class RegisterServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            try{
                String userName=request.getParameter("user_name");
                String userEmail=request.getParameter("user_email");
                String userPassword=request.getParameter("user_password");
                String userPhone=request.getParameter("user_phone");
                String userAddress=request.getParameter("user_address");
              //Validations
                if(userName.isEmpty()){
                    out.println("Name is Blank");
                    return;
                }
                if(userPassword.isEmpty()){
                    out.println("Password is Blank");
                    return;
                }
                if(userEmail.isEmpty()){
                    out.println("Email is Blank");
                    return;
                }
                if(userPhone.isEmpty()){
                    out.println("Phone is Blank");
                    return;
                }
                if(userAddress.isEmpty()){
                    out.println("Address is Blank");
                    return;
                }
            
                //Creating User Object to Store Data
               User user= new User(userName, userEmail,userPassword,userPhone,"default.jpg",userAddress,"normal");
               
              Session hibernateSession= FactoryProvider.getFactory().openSession();
              Transaction tx=hibernateSession.beginTransaction();
               User existingUser = (User) hibernateSession.createQuery("from User where userEmail = :email").setParameter("email", userEmail).uniqueResult();

            if (existingUser != null) {
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "❌ Email already registered!");
                response.sendRedirect("register.jsp");
                hibernateSession.close();
                return;
            }
              int userId= (int)hibernateSession.save(user);
              
          
              tx.commit();
              hibernateSession.close();
              
              HttpSession httpSession=request.getSession();
              httpSession.setAttribute("message","Registration Successfull !! User Id is:"+userId);
              response.sendRedirect("register.jsp");
              return;
              
            }catch(Exception e){
                e.printStackTrace();
                 HttpSession httpSession = request.getSession();
            httpSession.setAttribute("message", "Something went wrong on server!");
            response.sendRedirect("register.jsp");
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
