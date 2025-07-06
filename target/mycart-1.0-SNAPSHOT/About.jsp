<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>About Us</title>
        <%@include file="components/common_css_js.jsp" %>
        <style>
    body {
        background-color: #f8f9fa;
    }

    .about-section {
        padding: 60px;
        margin: 40px auto;
        background-color: white;
        border-radius: 12px;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        max-width: 1000px;
    }

    .about-heading {
        font-size: 36px;
        font-weight: bold;
        margin-bottom: 20px;
    }

    .about-text {
        font-size: 18px;
        line-height: 1.7;
    }

    .team-card {
        border: none;
        border-radius: 15px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease;
    }

    .team-card:hover {
        transform: scale(1.05);
    }

    .team-img {
        border-top-left-radius: 15px;
        border-top-right-radius: 15px;
        height: 300px;
        object-fit: cover;
    }
</style>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/style.css" />
    <!-- Add this -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
    />
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>

        <div class="  about-section ">
            <div class="text-center">
                <h2 class="about-heading">MyCart</h2>
                <p class="about-text">
                    Welcome to <strong>MyCart</strong> — your one-stop online shop for all things awesome! <br>
                    We are passionate about bringing you high-quality products at affordable prices.
                    Our mission is to make online shopping simple, fast, and reliable.
                </p>
            </div>

       <div class="row justify-content-center mt-5">
    <div class="col-md-6">
        <div class="card team-card">
            <img src="img/aboutus.png" class="card-img-top team-img" alt="Team Member">
            <div class="card-body text-center">
                <h5 class="card-title">Simplifying shopping, one click at a time.</h5>
             </div>
        </div>
    </div>
</div>

        </div>
           <%@include file="components/common_modal.jsp"%>

        <%@include file="components/footer.jsp" %>
    </body>
</html>
