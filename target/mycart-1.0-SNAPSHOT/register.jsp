<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <%@include file="components/common_css_js.jsp" %>

    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        <div class="container-fluid">
             <div class="row mt-5">
            <div class="col-md-4 offset-md-4">
                
                <div class="card">
                    <%@include file="components/message.jsp" %>
                    <div  class="card-body px-5">
                        <div class="text-center my-4">
    <svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="green" class="bi bi-cart3" viewBox="0 0 16 16">
        <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .49.598l-1 5a.5.5 0 0 1-.465.401l-9.397.472L4.415 11H13a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l.84 4.479 9.144-.459L13.89 4zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
    </svg>
</div>

                         <h3 class="text-center my-3">Sign Up Here !!</h3>
                         <form action="RegisterServlet" method="post">
                      <div class="form-group">
    <label for="name">User Name</label>
    <input name="user_name" type="text" class="form-control" id=name aria-describedby="emailHelp" placeholder="Enter Your Name">
   </div>
                      <div class="form-group">
    <label for="email">User Email</label>
    <input name="user_email" type="email" class="form-control" id=email aria-describedby="emailHelp" placeholder="Enter Your Email">
   </div>
                      <div class="form-group">
    <label for="password">User password</label>
    <input name="user_password" type="password" class="form-control" id=password aria-describedby="emailHelp" placeholder="Enter Your Password">
   </div>
                      <div class="form-group">
    <label for="phone">User Phone</label>
    <input name="user_phone" type="number" class="form-control" id=phone aria-describedby="emailHelp" placeholder="Enter Your Phone">
   </div>
                      <div class="form-group">
    <label for="phone">User Address</label>
    <textarea name="user_address" style="height: 200px;" class="form-control" placeholder="Enter your Address"></textarea>
    </div>
                    <div class="container text-center">                      
                        <button class="btn btn-outline-success">Register</button>
                        <button class="btn btn-outline-warning">Reset</button>
                    </div>
                        
                </form>
                    </div>
                </div>
            </div>
        </div>
        </div>
     </body>
</html>
