<%@page import="com.mycompany.mycart.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.mycart.entities.Product"%>
<%@page import="com.mycompany.mycart.dao.ProductDao"%>
<%@page import="com.mycompany.mycart.helper.FactoryProvider"%>
<%@page import="com.mycompany.mycart.entities.Category"%>
<%@page import="com.mycompany.mycart.entities.User"%>
<%
    User user1= (User)session.getAttribute("current-user");
%>

<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
  <div class="container">
    <a class="navbar-brand" href="index.jsp">MyCart</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="index.jsp" style="color: white">Home <span class="sr-only">(current)</span></a>
        </li>

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Categories
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item <%= (request.getParameter("category") == null || request.getParameter("category").equals("all")) ? "active" : "" %>"
              href="index.jsp?category=all" style="color: white">All Products</a>

            <%
              CategoryDao cdaoo = new CategoryDao(FactoryProvider.getFactory());
              List<Category> clistt = cdaoo.getCategories();

              String catParam = request.getParameter("category");
              int selectedCatId = -1;
              if (catParam != null && !catParam.equals("all")) {
                try {
                  selectedCatId = Integer.parseInt(catParam.trim());
                } catch (NumberFormatException e) {
                  selectedCatId = -1;
                }
              }

              for (Category c : clistt) {
                String activeClass = (c.getCategoryId() == selectedCatId) ? "active" : "";
            %>
              <a class="dropdown-item <%= activeClass %>" href="index.jsp?category=<%= c.getCategoryId() %>">
                <%= c.getCategoryTitle() %>
              </a>
            <%
              }
            %>
          </div>
        </li>
           <li class="nav-item">
               <a class="nav-link" href="About.jsp" style="color: white">About Us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="contact_us.jsp" style="color: white">Contact</a>
        </li>
      </ul>

      <form class="form-inline my-2 my-lg-0" action="search" method="get">
        <input class="form-control mr-sm-2" type="search" name="query" placeholder="Search Products" aria-label="Search">
        <button class="btn btn-custom-search my-2 my-sm-0" type="submit" style="background-color: #00bcd4; color: white; border: none;">
          Search
        </button>
      </form>

      <ul class="navbar-nav ml-auto">
        <!-- Cart Icon -->
        <li class="nav-item active">
          <a class="nav-link" href="#!">
            <svg class="w-6 h-6 text-gray-800 dark:text-white" data-toggle="modal" data-target="#cart" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
              <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="M5 4h1.5L9 16m0 0h8m-8 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4Zm8 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4Zm-8.5-3h9.25L19 7H7.312"/>
            </svg>
            <span class="ml-0 cart-items">0</span>
          </a>
        </li>

        <!-- About Us and Contact links -->
       

        <%
          if (user1 == null) {
        %>
          <li class="nav-item active">
            <a class="nav-link" href="login.jsp">Login</a>
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="register.jsp">Register</a>
          </li>
        <%
          } else {
        %>
          <li class="nav-item active">
            <a class="nav-link" href="<%= user1.getUserType().equals("admin") ? "admin.jsp" : "index.jsp" %>"><%= user1.getUserName() %></a>
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="LogoutServlet">Logout</a>
          </li>
        <%
          }
        %>
      </ul>
    </div>
  </div>
</nav>
