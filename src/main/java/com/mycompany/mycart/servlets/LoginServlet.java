 
package com.mycompany.mycart.servlets;

import com.mycompany.mycart.dao.UserDao;
import com.mycompany.mycart.entities.User;
import com.mycompany.mycart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jdk.internal.org.jline.terminal.TerminalBuilder;

 
public class LoginServlet extends HttpServlet {

             
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            //coding Area
           String email= request.getParameter("email");
           String password=request.getParameter("password");
           
           //Validations
             if(email.isEmpty()){
                    out.println("Email is Blank");
                    return;
                }
                if(password.isEmpty()){
                    out.println("Password is Blank");
                    return;
                }
           //Authenciate User
           UserDao userDao=new UserDao(FactoryProvider.getFactory());
           User user=userDao.getUserByEmailandPassword(email, password);
            System.out.print(user);
            HttpSession httpSession=request.getSession();
            
            if(user==null){
                 httpSession.setAttribute("message", "Invalid Details !! Try with Another one");
                response.sendRedirect("login.jsp");
                return;
            }
            else{
                out.println("<h1>Welcome"+user.getUserName()+"</h1>");
                //login
                httpSession.setAttribute("current-user", user);
                
                if(user.getUserType().equals("admin")){
                    //admin:-admin.jsp
                    response.sendRedirect("admin.jsp");
                }
                else if(user.getUserType().equals("normal")){
                    //normal:- normal.jsp
                    response.sendRedirect("index.jsp");
                }
                else{
                    out.println("We Have Not Identified User Type");
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
