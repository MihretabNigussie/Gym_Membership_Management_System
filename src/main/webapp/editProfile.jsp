<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
    />
 <title>ABEMIRE-GYM-editProfile</title>
 <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    />
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.7.2/font/bootstrap-icons.min.css"
      rel="stylesheet"
    />
</head>
<body class="d-flex flex-column vh-100">
	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");	
		if (session.getAttribute("id") == null ){
			response.sendRedirect("login.jsp");
		}	
	%>
    <header>
      <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
          <a class="navbar-brand" href="./welcome.jsp">ABEMIRE-GYM</a>
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
                <a class="nav-link me-3" href="./welcome.jsp">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link me-3" href="./aboutUs.jsp">About Us</a>
              </li>
              <li class="nav-item">
                <a class="nav-link me-3" href="./memebership.jsp"
                  >Membership Packages</a
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

    <main class="container my-5 flex-fill">
      <div class="row justify-content-center">
        <div class="col-md-8">
          <article class="card p-4">
            <h1 class="text-center mb-3">Edit Your Profile</h1>
            <form action="UpdateProfileServlet"  method = "post">
              <div class="mb-3">
                <label for="username" class="form-label"></label>
                  New Username </label
                >
                <input
                  type="text"
                  class="form-control"
                  name = "username"
                  id="username"
                  value = "${username}"
                  required
                
                />
              </div>
              <div class="mb-3">
                <label for="password" class="form-label"
                  >New Password </label
                >
                <div class="input-group">
                  <input
                    type="password"
                    class="form-control"
                    name = "password"
                    value = "${password}"
                    id="password"
                    required
                    
                  />
                  <button
                    class="btn btn-outline-secondary"
                    type="button"
                    id="togglePassword"
                  >
                    <i class="bi bi-eye"></i>
                  </button>
                </div>
              </div>
              <div id="popupMessage" class="text-center"></div>

              <button
                type="submit"
                class="btn btn-success text-white w-100 mb-3"
              >
                Save Changes
              </button>
            </form>
            
          </article>
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

  
        popup.style.backgroundColor = "#ff0000";
        popup.style.color = "#ffffff";
        popup.style.fontSize = "16px";
        popup.style.padding = "5px";
        popup.style.borderRadius = "5px";
        popup.style.marginBottom = "5px";

        setTimeout(function () {
            popup.innerHTML = "";
            popup.style.display = "none";
        }, 3000);
    }

   
    <% if ("true".equals(session.getAttribute("weak"))) { %>
        displayPopup("Password must contain at least 8 characters, one uppercase, one lowercase, one number and one special character");
    <% session.setAttribute("weak", "false"); } %>
</script>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    ></script>

    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js"
      integrity="sha384-4RD6HY97Jg5IFU6dznjzr8s9AW+2ggwxrS/DD1rZj7nrmQ+C0EraHf6Hf5joMO6K"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"
      integrity="sha384-huFkzC9Jt6U5NjzbwuEQOMq4tSxF8/H3Ed8sH+8L1tvUofQKhCk8FgR3IqZR+6Bb"
      crossorigin="anonymous"
    ></script>
    <script>
      const togglePassword = document.getElementById("togglePassword");
      const passwordField = document.getElementById("password");

      togglePassword.addEventListener("click", function () {
        const type =
          passwordField.getAttribute("type") === "password"
            ? "text"
            : "password";
        passwordField.setAttribute("type", type);
        this.querySelector("i").classList.toggle("bi-eye");
        this.querySelector("i").classList.toggle("bi-eye-slash");
      });
    </script>
  </body>
</html>