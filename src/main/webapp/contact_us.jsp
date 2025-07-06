<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="com.mycompany.mycart.entities.User"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Contact Us - MyCart</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/style.css" />
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/style.css" />
    <!-- Add this -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
    />
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
</head>

<jsp:include page="components/navbar.jsp" />

<div class="container mt-5 mb-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow-lg border-0">
                <div class="card-header bg-info text-white text-center">
                    <h3 class="mb-0">Get in Touch</h3>
                    <small>We'd love to hear from you</small>
                </div>
                <div class="card-body">

                    <%-- ✅ Show success message if exists --%>
                    <%
                        String message = (String) session.getAttribute("message");
                        if (message != null) {
                    %>
                    <div class="alert alert-success alert-dismissible fade show text-center" role="alert">
                        <strong><%= message %></strong>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <%
                            session.removeAttribute("message");
                        }
                    %>

                    <form action="ContactServlet" method="post">
                        <div class="form-group">
                            <label for="name">Name <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="name" name="name" placeholder="Your Name" required
                                value="<%= (session.getAttribute("current-user") != null) ? ((User)session.getAttribute("current-user")).getUserName() : "" %>">
                        </div>

                        <div class="form-group">
                            <label for="email">Email address <span class="text-danger">*</span></label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="Enter email" required
                                value="<%= (session.getAttribute("current-user") != null) ? ((User)session.getAttribute("current-user")).getUserEmail() : "" %>">
                        </div>

                        <div class="form-group">
                            <label for="subject">Subject <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="subject" name="subject" placeholder="Subject" required>
                        </div>

                        <div class="form-group">
                            <label for="message">Message <span class="text-danger">*</span></label>
                            <textarea class="form-control" id="message" name="message" rows="5" placeholder="Write your message here..." required></textarea>
                        </div>

                        <button type="submit" class="btn btn-info btn-block">Send Message</button>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>

    <%@include file="components/common_modal.jsp"%>

        <%@include file="components/footer.jsp" %>
</html>


