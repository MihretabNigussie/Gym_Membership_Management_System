<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>ABEMIRE-GYM UserList</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">
     <!-- Add this link to your HTML head section -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.18.0/font/bootstrap-icons.css" rel="stylesheet">
     
    <style>
        .card:hover {
            transform: scale(1.05);
            transition: transform 0.5s ease;
        }

        .reload-icon {
            animation: spin 1s infinite linear;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
       
    body {
        display: flex;
        flex-direction: column;
        min-height: 100vh; /* Set minimum height to the full viewport height */
        margin: 0; /* Remove default body margin */
    }

    main {
        flex: 1; /* Make the main content area take remaining vertical space */
    }

    </style>
</head>
<body class="d-flex flex-column min-vh-100">
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");	
    if (session.getAttribute("id") == null ){
        response.sendRedirect("login.jsp");
    }
%>
<header>
    
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
          <a class="navbar-brand" href="./adminPanel.jsp">ABEMIRE-GYM - AdminPage</a>
          <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarNav"
            aria-controls="navbarNav"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
              <li class="nav-item">
                <a class="nav-link me-3" href="./adminPanel.jsp">Create Package</a>
              </li>
              <li class="nav-item">
                <a class="nav-link me-3" href="./memebership.jsp">Membership List</a>
              </li>
              <li class="nav-item">
                <a class="nav-link me-3" href="./usersList.jsp"
                  >Users List</a>
              </li>
              
          </div>

          <a class="navbar-brand" href="./profile.jsp">
            <img
              src="data:image/jpeg;base64,${profilePicture}"
              alt="Profile Picture"
              width="50"
              height="50"
              class="d-inline-block align-text-top rounded-circle"
            />
          </a>
        </div>
      </nav>
      
     
</header>

<main class="container my-5">
	
	<div id="popupMessage" class="mb-3 text-center"></div>
    <h1 class="text-center">Users List</h1>
    <br>
    <form class="input-group mb-3" action="UsersSearchServlet">
        <input name="name" type="text" class="form-control" placeholder="write user name" aria-label="Search"
               aria-describedby="basic-addon2">
        <button class="btn btn-outline-secondary" type="submit">
            <span class="reload-icon bi bi-arrow-clockwise"></span> Search
        </button>
    </form>
    

    <%
        if ("true".equals(session.getAttribute("isSearching"))) {
            session.setAttribute("isSearching", "false");
    %>

    <%
        Integer searchResultLength = (Integer) session.getAttribute("searchResultLength");
        if (searchResultLength != null && searchResultLength != 0) {
    %>

    <c:forEach var="user" items="${usersSearchResult}">
        <div class="container mt-5">
        <div class="card shadow" style="max-height: 200px">
            <div class="row g-0">
                <div class="col-md-4" style="height: 200px">
                    <img
    src="data:image/jpeg;base64,${user.profilePicture}"
    class="card-img-top"
    alt="Profile Picture"
    style="max-height: 100%; object-fit: cover"
/>
                </div>
                <div class="col-md-8">
                    <div class="card-body d-flex flex-column justify-content-between h-100">
                        <div class="position-relative">
                            <h5 class="card-title"><strong>Username: </strong> ${user.name} 
                          <c:if test="${not empty sessionScope.id and not empty user.id}">
                                    <c:choose>
                                        <c:when test="${sessionScope.id eq user.id}">
                                            <small style = "color: green"><i>(you)</i> </small>
                                        </c:when>
                                        
                                    </c:choose>
                                </c:if>
                            
                            </h5>
                            
                            <p class="card-text"><strong>Email: </strong> ${user.email}</p>
                            <div class="position-absolute top-0 end-0">
                                <i class="bi bi-pencil">${user.role}</i>
                            </div>
                            
                        </div>
                        <div class="text-end">
                            <form action="DeleteUsersServlet">
                                <input type="hidden" name="userId" value="${user.id}">
                                <div class="text-end">
                                    <button type="submit" class="btn bg-danger text-white">
                                        Delete Account
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    </c:forEach>

    <a href="usersList.jsp" class="btn btn-outline-secondary mt-3">Go back</a>
	
	
    <%
    } else {
    %>

    <main class="container my-5 text-center">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <img src="images/noSearch.jpg" class="img-fluid rounded" alt="No Search Result" />
            </div>
        </div>
        <h1 class="mt-3">No Result Found!!</h1>
        <a href="usersList.jsp" class="btn btn-outline-secondary mt-3">Go back</a>
    </main>

    <%
    }
    %>

    <%
    } else {
    %>
    <jsp:include page="/UsersServlet"/>
    <c:forEach var="user" items="${usersList}">
    
    <div class="container mt-5">
        <div class="card shadow" style="max-height: 200px">
            <div class="row g-0">
                <div class="col-md-4" style="height: 200px">
                    <img
    src="data:image/jpeg;base64,${user.profilePicture}"
    class="card-img-top"
    alt="Profile Picture"
    style="max-height: 100%; object-fit: cover"
/>
                </div>
                <div class="col-md-8">
                    <div class="card-body d-flex flex-column justify-content-between h-100">
                        <div class="position-relative">
                            <h5 class="card-title"><strong>Username: </strong> ${user.name} 
                          <c:if test="${not empty sessionScope.id and not empty user.id}">
                                    <c:choose>
                                        <c:when test="${sessionScope.id eq user.id}">
                                            <small style = "color: green"><i>(you)</i> </small>
                                        </c:when>
                                        
                                    </c:choose>
                                </c:if>
                            
                            </h5>
                            
                            <p class="card-text"><strong>Email: </strong> ${user.email}</p>
                            <div class="position-absolute top-0 end-0">
                                <i class="bi bi-pencil">${user.role}</i>
                            </div>
                            
                        </div>
                        <div class="text-end">
                            <form action="DeleteUsersServlet">
                                <input type="hidden" name="userId" value="${user.id}">
                                <div class="text-end">
                                    <button type="submit" class="btn bg-danger text-white">
                                        Delete Account
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</c:forEach>
<%
        }
    %>
           
                           
    
    <div class="modal fade" id="deleteAccountModal" tabindex="-1" aria-labelledby="buyPackageModalLabel"
            aria-hidden="true">
            
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header bg-secondary text-white">
                        <h5 class="modal-title" id="buyPackageModalLabel">Confirmation</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p class="fs-5">Are you sure you want to delete your account?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                       
                        <form action="DeleteAccountServlet">
    <button type="submit" class="btn btn-danger" id="logoutButton">Delete</button>
</form>
                    </div>
                </div>
            </div>
        </div>
    
   
</main>

<footer class="bg-secondary text-white py-2">
    <div class="container">
        <div class="row justify-content-center align-items-center">
            <div class="col-auto">
                <a href="https://twitter.com/MereSenior" class="text-white me-3">
                    <img
                            src="images/twitter.svg"
                            alt="twitter icon"
                            width="30"
                            height="auto"
                            class="img-fluid"
                    />
                </a>
            </div>
            <div class="col-auto">
                <a href="https://www.instagram.com/mire.ab/" class="text-white">
                    <img
                            src="images/instagram.svg"
                            alt="instagram icon"
                            width="30"
                            height="auto"
                            class="img-fluid"
                    />
                </a>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col text-center">
                <p class="mb-0">&copy; 2023 ABEMIRE-GYM. All rights reserved.</p>
            </div>
        </div>
    </div>
</footer>

<script>
    function displayPopup(message) {
        var popup = document.getElementById("popupMessage");
        popup.innerHTML = message;

  
        popup.style.backgroundColor = "#00ffff";
        popup.style.color = "#ffffff";
        popup.style.fontSize = "20px";
        popup.style.padding = "10px";
        popup.style.borderRadius = "5px";
        popup.style.marginBottom = "10px";

        setTimeout(function () {
            popup.innerHTML = "";
            popup.style.display = "none";
        }, 3000);
    }

   
    <% if ("true".equals(session.getAttribute("successMessage"))) { %>
        displayPopup("You have successfully deleted the user.");
    <% session.setAttribute("successMessage", "false"); } %>
</script>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js"
        integrity="sha384-4RD6HY97Jg5IFU6dznjzr8s9AW+2ggwxrS/DD1rZj7nrmQ+C0EraHf6Hf5joMO6K"
        crossorigin="anonymous"></script>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"
        integrity="sha384-huFkzC9Jt6U5NjzbwuEQOMq4tSxF8/H3Ed8sH+8L1tvUofQKhCk8FgR3IqZR+6Bb"
        crossorigin="anonymous"></script>

<script>
    // Check if the purchaseSuccess attribute is set
    var purchaseSuccess = ${requestScope.purchaseSuccess};

    if (purchaseSuccess) {
        // Your modal show code here
        $(document).ready(function() {
            $('#buyPackageModal').modal('show');
        });
    }
</script>

</body>
</html>
