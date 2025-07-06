 <%@page import="com.mycompany.mycart.entities.User"%>
<%
    
    User user= (User)session.getAttribute("current-user");
    if(user==null){
        session.setAttribute("message","You are not Logged in!! Login first");
        response.sendRedirect("login.jsp");
        return;
    }
 %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Normal User panel</title>
    </head>
    <body>
        <h1> This is Normal user panel </h1>
    </body>
</html>
