<%-- 
    Document   : login
    Created on : Feb 5, 2020, 11:15:24 PM
    Author     : yuyun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <title>Login</title>
    </head>
    <body>
        <div class="container col-sm-4" style="top: 100px">
            <h2 style="text-align:center">LOGIN</h2>
            <form action="login" method="post" class="was-validated">
                <div class="form-group">
                    <label for="eml">Email:</label>
                    <input type="email" class="form-control" id="username" placeholder="Enter Your Email" name="username" required>
                    <div class="valid-feedback">Valid.</div>
                    <div class="invalid-feedback">Please fill your email </div>
                </div>
                <div class="form-group">
                    <label for="pwd">Password:</label>
                    <input type="password" class="form-control" id="password" placeholder="Enter password" name="password" required>
                    <div class="valid-feedback">Valid.</div>
                    <div class="invalid-feedback">Please fill out this field </div>
                </div>
                <button type="submit" class="btn btn-primary btn-block text-white" style="background: #1f0a2f">Login</button>
                <div class="form-group text-center" style="margin-top :10px">
                    <label style="text-align: center">Register for an account?</label>
                </div>
            </form>
        </div>
    </body>
</html>
