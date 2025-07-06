<%-- 
    Document   : index
    Created on : 29 Jun 2025, 12:31:05 pm
    Author     : LENOVO
--%>

<%@page import="com.mycompany.mycart.helper.helper"%>
<%@page import="com.mycompany.mycart.entities.Category"%>
<%@page import="com.mycompany.mycart.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.mycart.entities.Product"%>
<%@page import="com.mycompany.mycart.dao.ProductDao"%>
<%@page import="com.mycompany.mycart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyCart-Home</title>
        <%@include file="components/common_css_js.jsp" %>
          </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        <div class="container-fluid">
        <div class="row mt-3 mx-2">
            <%
                String cat=request.getParameter("category");
               // out.println(cat);
                
                ProductDao dao=new ProductDao(FactoryProvider.getFactory());
                List<Product>  list=null;
                if(cat ==  null || cat.trim().equals("all")){
                    list=dao.getAllProducts();
                }
                else{
                
                int cid=Integer.parseInt(cat.trim());
                list=dao.getAllProductsById(cid);
                
                
                }
              
                CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
                List<Category> clist = cdao.getCategories();
            %>    
            <!--  show Category-->
         <div class="col-md-2">
                <div class="list-group mt-4 ">
                 <a href="index.jsp?category=all" class="list-group-item list-group-item-action <%= ("all".equals(cat) ? "active" : "") %> ">All Products</a>
                </div>
                 <% 
                for(Category c :clist){  
                String activeClass = "";
                     
                if(cat != null && !cat.equals("all") && c.getCategoryId() == Integer.parseInt(cat)){
                 activeClass = "active";
                     }
                %>
                     
          <a href="index.jsp?category=<%=c.getCategoryId()%>" class="list-group-item list-group-item-action <%= activeClass %> "><%= c.getCategoryTitle()%></a>

                  <%
                        } 
                    %>
                
                
            </div>

            <!-- show Product-->
            <div class="col-md-10">
               <!--row-->
               <div class="row mt-4">
                   <!--col:12-->
                   <div class="col-md-12">
                       <div class="card-columns">
                           <!--traversing Products-->
                           <%
                           for(Product p:list){
                           %>
                            
                           <!--product Card-->
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
                               if(list.size()==0){

                               %>
              <div class="d-flex justify-content-center align-items-center" style="height: 100vh;">
    <div style="padding: 20px; border: 2px  solid #ff4d4d;  color: #cc0000; font-weight: bold; border-radius: 10px; text-align: center;">
        <h5>No products available in this category</h5>
    </div>
</div>

                            <%   
                                }
                           %>
                           
                       </div>

                       
                   </div>
                   
               </div>
               
            </div>
            
            
        </div>
        
           </div>
                           
                <%@include file="components/common_modal.jsp"%>
                        <%@include file="components/footer.jsp" %>

    </body>
</html>
