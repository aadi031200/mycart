<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login-MyCart</title>
        <%@include file="components/common_css_js.jsp" %>
        <!-- Make sure Font Awesome CDN is included in common_css_js.jsp like below:
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        -->
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        <div class="container-fluid">
            <div class="row mt-3">
                <div class="col-md-6 offset-md-3">
                    <div class="card mt-3">
                        <div class="card-header custom-bg text-white text-center">
                            <h3><i class="fas fa-sign-in-alt mr-2"></i>Login Here</h3>
                        </div>
                        <div class="card-body">
                            <%@include file="components/message.jsp" %>
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="email-addon">
                                                <i class="fas fa-envelope"></i>
                                            </span>
                                        </div>
                                        <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp email-addon" placeholder="Enter email" required>
                                    </div>
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
  <label for="exampleInputPassword1">Password</label>
  <div class="input-group">
    <div class="input-group-prepend">
      <span class="input-group-text" id="password-addon">
        <i class="fas fa-lock"></i>
      </span>
    </div>
    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" aria-describedby="password-addon">
  </div>
</div>

                                <a href="register.jsp" class="text-center d-block mb-2">If not registered click here</a> 
                                <div class="container-fluid text-center">
                                    <button type="submit" class="btn btn-primary custom-bg border-0">Submit</button>                                   
                                    <button type="reset" class="btn btn-primary custom-bg border-0">Reset</button>                                   
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>     
        </div>
    </body>
</html>
