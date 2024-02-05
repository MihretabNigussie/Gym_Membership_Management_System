<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>ABEMIRE-GYM-signUp</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.7.2/font/bootstrap-icons.min.css" rel="stylesheet">
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
    <div id="popupMessage" class="mb-3 text-center"></div>
        <div class="row justify-content-center">
            <div class="col-md-8">
                <article class="card p-4">
                    <h1 class="text-center mb-4">Sign Up</h1>
                    <form action="RegisterServlet" method="post" enctype="multipart/form-data">
    <div class="mb-3">
        <label for="username" class="form-label">Username <span id="requiredname">*</span></label>
        <input type="text" class="form-control" name="username" id="username" placeholder="Enter your username" required>
    </div>
    <div class="mb-3">
        <label for="email" class="form-label">Email <span id="email">*</span></label>
        <input type="email" class="form-control" name="email" id="email" placeholder="Enter your email" required>
    </div>

    <div class="mb-3">
        <label for="password" class="form-label">Password <span id="requiredpassword">*</span></label>
        <div class="input-group">
            <input type="password" class="form-control" name="password" id="password" placeholder="Enter your password" required>
            <button class="btn btn-outline-secondary" type="button" id="togglePassword">
                <i class="bi bi-eye"></i>
            </button>
        </div>
    </div>
    
    <div id="popupMessage1" class="text-center"></div>
    
    <div class="mb-3">
        <label for="profilePicture" class="form-label">Profile Picture</label>
        <input type="file" class="form-control" name="profilePicture" id="profilePicture">
    </div>

    <button type="submit" class="btn btn-secondary w-100 mb-3">Sign Up</button>
</form>

                    <p class="text-center">
                        <small>Already have an account? </small>
                        <a href="./login.jsp">Login</a>
                    </p>
                </article>
            </div>
        </div>
    </main>

    <footer class="bg-secondary text-white py-2">
        <div class="container">
            <div class="row justify-content-center align-items-center">
                <div class="col-auto">
                    <a href="https://twitter.com/MereSenior" class="text-white me-3">
                        <img src="images/twitter.svg" alt="twitter icon" width="30" height="auto" class="img-fluid">
                    </a>
                </div>
                <div class="col-auto">
                    <a href="https://www.instagram.com/mire.ab/" class="text-white">
                        <img src="images/instagram.svg" alt="instagram icon" width="30" height="auto" class="img-fluid">
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
        var popup = document.getElementById("popupMessage1");
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
        displayPopup("You have successfully deleted your account.");
    <% session.setAttribute("successMessage", "false"); } %>
</script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js" integrity="sha384-4RD6HY97Jg5IFU6dznjzr8s9AW+2ggwxrS/DD1rZj7nrmQ+C0EraHf6Hf5joMO6K" crossorigin="anonymous"></script>
    <script>
        const togglePassword = document.getElementById("togglePassword");
        const passwordField = document.getElementById("password");

        togglePassword.addEventListener("click", function () {
            const type =
                passwordField.getAttribute("type") === "password" ?
                "text" :
                "password";
            passwordField.setAttribute("type", type);
            this.querySelector("i").classList.toggle("bi-eye");
            this.querySelector("i").classList.toggle("bi-eye-slash");
        });
    </script>
</body>

</html>
