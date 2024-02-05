<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>ABEMIRE-GYM-profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
        crossorigin="anonymous" />
        
     <style type="text/css">
     	html, body {
    height: 100%;
    overflow: hidden;
}
     	
     </style>
</head>

<body class="d-flex flex-column min-vh-100">
    <%
    
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");	
        if (session.getAttribute("id") == null) {
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

    <main class="container my-5" style="height: 100vh; overflow-y: auto">
    <div id="popupMessage" class="mb-3 text-center"></div>
        <div class="row">
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body text-center">
                        <img src="data:image/jpeg;base64,${profilePicture}" class="img-fluid rounded-circle mb-3" alt="Profile Picture" style="width: 150px; height: 150px" />
                        <h2 class="card-title">${username}</h2>
                        <p class="card-text">
                            <a href="./editProfile.jsp" class="btn btn-outline-secondary">Edit Profile</a>
                        </p>
                    </div>
                </div>
            </div>
            
            <%
            if ("client".equals(session.getAttribute("role"))) {
            
            %>
            
            <div class="col-md-9">
                <div class="card">
                    <div class="card-body">
                        <h3>Your Packages</h3>
                        
                        
                        
                        <jsp:include page="/SubscribedPackagesServlet" />
                        
                        
                        <%
                        
                        Integer searchResultLength = (Integer) session.getAttribute("subscribedPackagesLength");
                       	
        if (searchResultLength != null && searchResultLength != 0) {
    %>
                        <c:forEach var="packagesList" items="${subscribedPackages}">
                        
                        
    <div class="container mt-5">
        <div class="card shadow" style="max-height: 400px">
            <div class="row g-0">
                <div class="col-md-4" style="height: 230px">
                    <img src="data:image/jpeg;base64,${packagesList.packagePicture}" class="card-img-top" alt="Gym 1"
                        style="min-height: 230; object-fit: cover" />
                </div>
                <div class="col-md-8">
                    <div class="card-body d-flex flex-column justify-content-between h-100">
                        <div>
                            <h5 class="card-title">${packagesList.name}</h5>
                            <p class="card-text"><strong>Description: </strong>${packagesList.description}</p>
                            <p><strong>Price: </strong> ${packagesList.price} birr</p>
                        </div>
                        <form action="UnsubscribePackagesServlet" >
                            <!-- Input field for packageId with dynamic value -->
                            <input type="hidden" name="packageId" value="${packagesList.id}">
                            <div class="text-end">
                                <button type="submit" class="btn btn-danger text-white">
                                    Unsubscribe
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:forEach>

 <%
    } else {
    %>

    <main class="container my-5 text-center">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <img src="images/empty.png" class="img-fluid rounded" alt="No Search Result" />
            </div>
        </div>
        <h1 class="mt-3">You haven't subscribed any packages yet!</h1>
        
    </main>
    <%
    }
    %>
                        
                    </div>
                </div>
                 <%
            }
                %>
                
                <div class="text-end mt-3">
                
               
                
		<button class="btn bg-secondary text-white" data-bs-toggle="modal" data-bs-target="#logoutModal">
                        Log out
                    </button>
                  
                </div>
                <div class="text-end mt-3">
                    <button class="btn bg-danger text-white" data-bs-toggle="modal" data-bs-target="#deleteAccountModal">
                        Delete Account
                    </button>
                </div>
            </div>
        </div>
        <!-- Modal -->
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
        <!-- Modal -->
        <div class="modal fade" id="logoutModal" tabindex="-1" aria-labelledby="buyPackageModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header bg-secondary text-white">
                        <h5 class="modal-title" id="buyPackageModalLabel">Confirmation</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p class="fs-5">Are you sure you want to log out your account?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <!-- Add an ID to the Log out button -->
                        <form action="LogoutServlet">
    <button type="submit" class="btn btn-danger" id="logoutButton">Log out</button>
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
                        <img src="images/twitter.svg" alt="twitter icon" width="30" height="auto"
                            class="img-fluid" />
                    </a>
                </div>
                <div class="col-auto">
                    <a href="https://www.instagram.com/mire.ab/" class="text-white">
                        <img src="images/instagram.svg" alt="instagram icon" width="30" height="auto"
                            class="img-fluid" />
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
        displayPopup("You have successfully unsubscribed the package.");
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
        document.getElementById("logoutButton").addEventListener("click", function () {
            window.location.href = "./login.html";
        });
    </script>
    <script>
        document.getElementById("deleteBtn").addEventListener("click", function () {
            window.location.href = "./signUp.html";
        });
    </script>
</body>

</html>
