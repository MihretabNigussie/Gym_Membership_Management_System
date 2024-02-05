<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>ABEMIRE-GYM-about</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous"/>
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
                <img src="data:image/jpeg;base64,${profilePicture}" alt="Profile Picture" width="50" height="50"
                     class="d-inline-block align-text-top rounded-circle"/>
            </a>
        </div>
    </nav>
</header>

<main class="container my-5">
    <h1 class="text-center">AbeMire Gym</h1>
    <div class="row mt-4">
        <div class="col-md-8 offset-md-2">
            <p class="fs-5">
                Welcome to our Abemine gym located conveniently on the bustling main street! At our facility, we prioritize
                your fitness journey, offering flexible subscription packages tailored to your needs—choose from daily,
                monthly, 6-month, or yearly memberships. Our commitment to cleanliness is unwavering; our gym undergoes
                thorough cleaning twice daily to ensure a pristine environment for your workouts. With ample parking
                available, your visit is hassle-free from the moment you arrive. Experience the best in fitness with our
                dedicated aerobics service led by professional trainers. Our team is devoted to guiding and motivating
                you through invigorating aerobics sessions, designed to elevate your fitness levels and surpass your
                goals. Join us and discover a welcoming, vibrant space where fitness meets convenience and expertise.
            </p>
        </div>
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
