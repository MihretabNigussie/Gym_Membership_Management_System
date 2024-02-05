<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Page - Create Package</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
</head>

<body>
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
    </header>
	<main class="container my-5">
    <div class="container mt-5">
        <h1 class="text-center mb-4">Edit Package</h1>

        <form action="EditPackageServlet" method="post">
            <div class="mb-3">
                <label for="packageName" class="form-label">Package Name</label>
                <input type="text" class="form-control" name= "packageName" id="packageName" value = "${packageName}"  required>
            </div>

            <div class="mb-3">
    <label for="packageDescription" class="form-label">Package Description</label>
    <textarea class="form-control" id="packageDescription" name="packageDescription" rows="5" required>${packageDescription}</textarea>
</div>


            <div class="mb-3">
                <label for="packagePrice" class="form-label">Package Price</label>
                <input type="text" class="form-control" id="packagePrice" name= "packagePrice"  value = "${packagePrice}"required>
            </div>

			
            <button type="submit" class="btn btn-secondary w-100 mb-3">Edit Package</button>
        </form>
    </div>
    </main>
    
    <footer class="bg-secondary text-white py-2 mt-auto">
    <div class="container">
        <div class="row justify-content-center align-items-center">
            <div class="col-auto">
                <a href="https://twitter.com/MereSenior" class="text-white me-3">
                    <img src="images/twitter.svg" alt="twitter icon" width="30" height="auto"
                         class="img-fluid"/>
                </a>
            </div>
            <div class="col-auto">
                <a href="https://www.instagram.com/mire.ab/" class="text-white">
                    <img src="images/instagram.svg" alt="instagram icon" width="30" height="auto"
                         class="img-fluid"/>
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