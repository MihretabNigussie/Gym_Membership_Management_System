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
<title>ABEMIRE-GYM-login</title>
<link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    />
    <!-- Bootstrap Icons CSS -->
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.7.2/font/bootstrap-icons.min.css"
      rel="stylesheet"
    />
</head>
<body class="d-flex flex-column vh-100">
	

    <header>
      <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
          <a class="navbar-brand" href="">ABEMIRE-GYM</a>
        </div>
      </nav>
    </header>
    <main class="container my-5 flex-fill">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <article class="card p-4">
                    <h1 class="text-center mb-4">Welcome Back</h1>
                    <h3 class="text-center mb-3">Log in</h3>
                    <form action="LoginServlet" method="post">
                         <div class="mb-3">
                <label for="email" class="form-label"
                  >Email <span id="email">*</span></label
                >
                <input
                  type="email"
                  class="form-control"
                  name = "email"
                  id="email"
                  placeholder="Enter your email"
                  required
                />
              </div>

                        <div class="mb-3">
                            <label for="password" class="form-label">Password <span id="requiredpassword">*</span></label>
                            <div class="input-group">
                                <input type="password" class="form-control" name="password" id="password"
                                    placeholder="Enter your password" required />
                                <button class="btn btn-outline-secondary" type="button" id="togglePassword">
                                    <i class="bi bi-eye"></i>
                                </button>
                            </div>
                        </div>
                        
						<div id="popupMessage" class="mb-3 text-center"></div>
                        <button type="submit" class="btn btn-secondary w-100 mb-3">Login</button>
                    </form>

                    <p class="text-center">
                        <small>Don't have an account?</small>
                        <a href="./index.jsp">Create an account</a>
                    </p>
                </article>
            </div>
        </div>
    </main>
    <footer class="bg-secondary text-white py-2 fixed-bottom">
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
        <div class="row mt-2">
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
        popup.style.marginBottom = "10px";

        setTimeout(function () {
            popup.innerHTML = "";
            popup.style.display = "none";
        }, 3000);
    }

   
    <% if ("true".equals(session.getAttribute("isError"))) { %>
        displayPopup("Invalid email or password. Please check your credentials and try again.");
    <% session.setAttribute("isError", "false"); } %>
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