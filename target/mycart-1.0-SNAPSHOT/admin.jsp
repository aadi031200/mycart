<%@page import="com.mycompany.mycart.helper.helper"%>
<%@page import="org.hibernate.boot.model.source.internal.hbm.Helper"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.mycart.entities.Category"%>
<%@page import="com.mycompany.mycart.dao.CategoryDao"%>
<%@page import="com.mycompany.mycart.helper.FactoryProvider"%>
<%@page import="com.mycompany.mycart.entities.User"%>
<%
    
    User user= (User)session.getAttribute("current-user");
    if(user==null){
        session.setAttribute("message","You are not Logged in!! Login first");
        response.sendRedirect("login.jsp");
        return;
    }
    else{
        if(user.getUserType().equals("normal")){
        session.setAttribute("message","You are not Admin !! Do not access this Page");
        response.sendRedirect("login.jsp");
        return;
     }
    }
 %>
  <%
          CategoryDao cdao =new CategoryDao(FactoryProvider.getFactory());
           List<Category> list=cdao.getCategories();
           
//getting Count
           Map<String,Long> m = helper.getCounts(FactoryProvider.getFactory());
                 
  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
            
        <div class="container admin">
            
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
            <div class="row mt-3">
                <!--first col..-->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style = "max-width:125px;" class="img-fluid rounded-circle" src="img/customer.gif" alt="user_icon"/>
                            </div>
                            <h1><%=m.get("userCount")%></h1>
                            <h1 class=" text-uppercase text-muted">Users</h1>
                        </div>
                    </div>
                </div>
                <!--second col..-->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style = "max-width:125px;" class="img-fluid " src="img/cate.gif" alt="user_icon"/>
                            </div>
                            <h1><%=list.size()%></h1>
                            <h1 class=" text-uppercase text-muted">Categories</h1>
                        </div>
                    </div> 
                </div>
                <!--third col..-->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style = "max-width:125px;" class="img-fluid " src="img/box.gif" alt="user_icon"/>
                            </div>
                            <h1><%=m.get("productCount")%></h1>
                            <h1 class=" text-uppercase text-muted">Products</h1>
                        </div>
                    </div>
                </div>
            </div>
            
            <!--second row-->
            <div class="row mt-3">
                <!--second row first col-->
                <div class=" col-md-6">
                      <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center" >
                            <div class="container" >
                                <img style = "max-width:125px;" class="img-fluid" src="img/add.gif" alt="user_icon"/>
                            </div>
                            <p class="mt-2">Click here to add new Category</p>
                            <h1 class=" text-uppercase text-muted">Add Category</h1>
                        </div>
                    </div>
                    
                    
                </div>
                <!--second row second col-->
                <div class=" col-md-6">
                      <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style = "max-width:125px;" class="img-fluid " src="img/maths.gif" alt="user_icon"/>
                            </div>
                            <p class="mt-2">Click here to add new product</p>
                            <h1 class=" text-uppercase text-muted">Add Product</h1>
                        </div>
                    </div>
                    
                    
                </div>
            </div>
 
        </div>
           <!--Add category-->  
 

<!-- Modal -->
<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog  modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
          <form action="ProductOperationServlet"  method ="post">
              
              <input type="hidden" name="operation" value="addcategory">
              <div class="form-group">
                  <input type="text" class="form-control" name="catTitle" placeholder="Enter Category Title" required/>
              </div>
              <div class="form-group">
                  <textarea style="height: 250px;" class="form-control" placeholder="Enter Category Description" name="catDescription" required></textarea>
              </div>
              <div class="container text-center">
               <button  class="btn btn-outline-success">Add Category</button>
               <button type="button" class="btn btn-outline-warning" data-dismiss="modal">Close</button>
              </div>
          </form>
          
          
      </div>
      <div class="modal-footer">
         
      </div>
    </div>
  </div>
</div>
           <!-- end of Add category-->
           
           <!--Start Of Product Modal-->
 
           <%@include file="components/common_modal.jsp"%>

<!-- Modal -->
<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Product Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
            <!--Start of form-->
            <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                 <input type="hidden" name="operation" value="addproduct"/>
                <!--Product Title-->
              <div class="form-group">
              <input type="text" class="form-control" name="pName" placeholder="Enter Title Of Product" required/>
              </div>
                <!--Product Description-->
              <div class="form-group">
                  <textarea style="height: 150px;" class="form-control" placeholder="Enter Product Description" name="pDesc" required></textarea>
              </div>
                <!--Product Price-->
                <div class="form-group">
              <input type="number" class="form-control" name="pPrice" placeholder="Enter Price Of Product" required/>
              </div>
                <!--Product Discount-->
                <div class="form-group">
              <input type="number" class="form-control" name="pDiscount" placeholder="Enter Discount On Product" required/>
              </div>
                  <!--Product Quantity-->
                <div class="form-group">
              <input type="number" class="form-control" name="pQuantity" placeholder="Enter Quantity Of Product" required/>
                 <!--Product Categories-->
                
                 <div class="form-group mt-3"> 
                     <select name="catId" class="form-control">
                         <%   for(Category c:list){
                         %>
                         
                         <option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>
                         <% } %>
                     </select>
                 </div>
                 <!--Product file-->
                 <div class="form-group">
                     <label for="pPic">Select Picture Of Product</label>
                     <br>
                     <input  type="file" id= "pPic" name="pPic" required/>
                 </div>
                 <!--Submit Button-->
                   <div class="container text-center">
               <button  class="btn btn-outline-success">Add Product</button>
               <button type="button" class="btn btn-outline-warning" data-dismiss="modal">Close</button>
              </div>
            </form>
        
 
             <!--end of form-->
      </div>
    </div>
  </div>
</div>
           <!--End Of Product Modal-->

    </body>
</html>
              
