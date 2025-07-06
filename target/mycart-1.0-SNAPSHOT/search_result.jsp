<%@page import="com.mycompany.mycart.helper.helper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>
<%@page import="com.mycompany.mycart.entities.Product"%>
<%@include file="components/common_css_js.jsp"%>
<%@include file="components/navbar.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Results - MyCart</title>
</head>
<body>

<div class="container mt-4">
    <h3>Search Results:</h3>
    <div class="row">
        <%
            List<Product> products = (List<Product>) request.getAttribute("products");
            if (products == null || products.isEmpty()) {
        %>
            <div class="col-12 text-center mt-4">
                <h5>No products found for your search!</h5>
            </div>
        <%
            } else {
                for (Product p : products) {
        %>
             <div class="card product-card">
                               <div class="container text-center">
                             <img class="card-img-top m-2" src="img/products/<%= p.getpPhoto() %>" style="max-height: 270px; max-width: 100%; width: auto" alt="Card image cap">

                               </div>
                               <div class="card-body">
                                   
                                   <h5 class="card-title"><%= p.getpName() %></h5>
                                   <p class="card-text"> <%= helper.get10Words(p.getpDesc()) %> </p>   
                               </div>
                                   <div class="card-footer text-center">
                                       <button class="btn custom-bg text-white" onclick="add_to_cart(<%=p.getpId()%>,'<%=p.getpName()%>',<%=p.getPriceAfterApplyingDiscount()%>)">Add to Cart</button>
                                       <button class="btn btn-outline-success ml-4">&#8377; <%=p.getPriceAfterApplyingDiscount()%>/- <span class="text-secondary discount-label"> &#8377;<%=p.getpPrice()%>, <%=p.getpDiscount()%>%off</span></button>
                                   </div>
                           </div>
        <%
                }
            }
        %>
    </div>
</div>
                <%@include file="components/common_modal.jsp"%>

</body>
</html>
