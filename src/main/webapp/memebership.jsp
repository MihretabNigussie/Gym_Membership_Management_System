<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>ABEMIRE-GYM-membership</title>
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

	<%
        if ("admin".equals(session.getAttribute("role"))) {
            
    %>
    
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
                  >Users List</a
                >
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
      
     <%
    } else {
    %>
     
    
    
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="./welcome.jsp">ABEMIRE-GYM</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link me-3" href="./welcome.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link me-3" href="./aboutUs.jsp">About Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link me-3" href="./memebership.jsp">Membership Packages</a>
                    </li>
                </ul>
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
    
     <%
    }
    %>
</header>

<main class="container my-5">
	<div id="popupMessag2" class="mb-3 text-center"></div>
	<div id="popupMessage" class="mb-3 text-center"></div>
	<div id="popupMessage1" class="mb-3 text-center"></div>
    <h1 class="text-center">Membership Packages List</h1>
    <br>
    <form class="input-group mb-3" action="PackageSearchServlet">
        <input name="name" type="text" class="form-control" placeholder="write package name" aria-label="Search"
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

    <c:forEach var="packagesList" items="${searchResult}">
        <div class="container mt-5">
            <div class="card shadow" style="max-height: 400px">
                <div class="row g-0">
                    <div class="col-md-4" style="height: 200px">
                        <img
                                src="data:image/jpeg;base64,${packagesList.packagePicture}"
                                class="card-img-top"
                                alt="Gym 1"
                                style="max-height: 100%; object-fit: cover"
                        />
                    </div>
                    <div class="col-md-8">
                        <div
                                class="card-body d-flex flex-column justify-content-between h-100"
                        >
                            
                               <%
        if ("admin".equals(session.getAttribute("role"))) {
            
    %>
    
    			<div class="position-relative">
    <h5 class="card-title">${packagesList.name}</h5>
    <p class="card-text">
        <strong>Description: </strong> ${packagesList.description}
    </p>
    <p><strong>Price: </strong> ${packagesList.price} birr</p>

    <form action="GetPackageInfoServlet" method="post">
        <!-- Input field for packageId with dynamic value -->
        <input type="hidden" name="packageId" value="${packagesList.id}">

        <div class="position-absolute top-0 end-0">
            <button type="submit" class="btn bg-secondary text-white">
                <i class="bi bi-pencil">Edit</i> 
            </button>
        </div>
    </form>
</div>



			<div class="text-end">
			
			<form action="DeletePackageServlet">
                                <!-- Input field for packageId with dynamic value -->
                                <input type="hidden" name="packageId" value="${packagesList.id}">
                                 
    
                                <div class="text-end">
                                    <button type="submit" class="btn bg-danger text-white">
                                        Delete Package
                                    </button>
                                </div>
                                
                              
                            </form>
                              
                                </div>

		
     <%
    } else {
    %>		
    					<div>
                                <h5 class="card-title">${packagesList.name}</h5>
                                <p class="card-text">
                                    <strong>Description: </strong> ${packagesList.description}
                                </p>
                                <p><strong>Price: </strong> ${packagesList.price} birr</p>
                            </div>
    
                                <form action="BuyPackageServlet" method="post">
                                <!-- Input field for packageId with dynamic value -->
                                <input type="hidden" name="packageId" value="${packagesList.id}">
                                 
    
                                <div class="text-end">
                                    <button type="submit" class="btn bg-secondary text-white">
                                        Buy Package
                                    </button>
                                </div>
                                
                              
                            </form>
                                
                                
                             <%
    }
    %>
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>

    <a href="memebership.jsp" class="btn btn-outline-secondary mt-3">Go back</a>
	
	
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
        <a href="memebership.jsp" class="btn btn-outline-secondary mt-3">Go back</a>
    </main>

    <%
    }
    %>

    <%
    } else {
    %>
    <jsp:include page="/PackagesServlet"/>
    <c:forEach var="packagesList" items="${packagesList}">
        <div class="container mt-5">
            <div class="card shadow" style="max-height: 200px">
                <div class="row g-0">
                    <div class="col-md-4" style="height: 200px">
                        <img
                                src="data:image/jpeg;base64,${packagesList.packagePicture}"
                                class="card-img-top"
                                alt="Gym 1"
                                style="max-height: 100%; object-fit: cover"
                        />
                    </div>
                    <div class="col-md-8">
                        <div
                                class="card-body d-flex flex-column justify-content-between h-100"
                        >
                            
                               <%
        if ("admin".equals(session.getAttribute("role"))) {
            
    %>
    
    			<div class="position-relative">
    <h5 class="card-title">${packagesList.name}</h5>
    <p class="card-text">
        <strong>Description: </strong> ${packagesList.description}
    </p>
    <p><strong>Price: </strong> ${packagesList.price} birr</p>

    <form action="GetPackageInfoServlet" method="post">
        <!-- Input field for packageId with dynamic value -->
        <input type="hidden" name="packageId" value="${packagesList.id}">

        <div class="position-absolute top-0 end-0">
            <button type="submit" class="btn bg-secondary text-white">
                <i class="bi bi-pencil">Edit</i> 
            </button>
        </div>
    </form>
</div>



			<div class="text-end">
			
			<form action="DeletePackageServlet">
                                <!-- Input field for packageId with dynamic value -->
                                <input type="hidden" name="packageId" value="${packagesList.id}">
                                 
    
                                <div class="text-end">
                                    <button type="submit" class="btn bg-danger text-white">
                                        Delete Package
                                    </button>
                                </div>
                                
                              
                            </form>
                              
                                </div>

		
     <%
    } else {
    %>		
    					<div>
                                <h5 class="card-title">${packagesList.name}</h5>
                                <p class="card-text">
                                    <strong>Description: </strong> ${packagesList.description}
                                </p>
                                <p><strong>Price: </strong> ${packagesList.price} birr</p>
                            </div>
    
                                <form action="BuyPackageServlet" method="post">
                                <!-- Input field for packageId with dynamic value -->
                                <input type="hidden" name="packageId" value="${packagesList.id}">
                                 
    
                                <div class="text-end">
                                    <button type="submit" class="btn bg-secondary text-white">
                                        Buy Package
                                    </button>
                                </div>
                                
                              
                            </form>
                                
                                
                             <%
    }
    %>
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
	
    <%
    }
    %>
    
    
   
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
        var popup = document.getElementById("popupMessag2");
        popup.innerHTML = message;

  
        popup.style.backgroundColor = "#00ff00";
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
        displayPopup("You have successfully subscribed the package.");
    <% session.setAttribute("successMessage", "false"); } %>
</script>


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
        displayPopup("You have successfully created the package.");
    <% session.setAttribute("successMessage", "false"); } %>
</script>


<script>
    function displayPopup(message) {
        var popup = document.getElementById("popupMessage1");
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
        displayPopup("You have successfully deleted the package.");
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



</body>
</html>
