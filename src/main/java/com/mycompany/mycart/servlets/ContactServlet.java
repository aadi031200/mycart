package com.mycompany.mycart.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

 public class ContactServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // Step 1: Get form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");
        
        // Step 2: (Optional) Print in console for debugging
        System.out.println("Contact Form Submitted:");
        System.out.println("Name: " + name);
        System.out.println("Email: " + email);
        System.out.println("Subject: " + subject);
        System.out.println("Message: " + message);
        
        // Step 3: Store success message in session
        HttpSession session = request.getSession();
        session.setAttribute("message", "Your response has been submitted successfully!");

        // Step 4: Redirect back to contact page
        response.sendRedirect("contact_us.jsp");
    }
}
