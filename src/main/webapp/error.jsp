<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <style>
        body {
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #f8f9fa;
        }

        .error-container {
            text-align: center;
        }

        .error-code {
            font-size: 5em;
            font-weight: bold;
            color: #dc3545;
        }

        .error-message {
            font-size: 1.5em;
            margin-top: 10px;
            color: #6c757d;
        }
    </style>
</head>

<body>

	<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");	
    if (session.getAttribute("id") == null ){
        response.sendRedirect("login.jsp");
    }
%>
    <div class="error-container">
        <div class="error-code">Ooops!</div>
        <div class="error-message"> ${errorMessage} </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>