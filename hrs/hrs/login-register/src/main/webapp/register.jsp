<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HRS</title>
<link rel="stylesheet" type="text/css" href="registerStyle.css">
</head>
<body>
<div class="registration-container">
        <h2>Register</h2>
        <form action="RegisterServlet" method="post">
            <input type="text" name="fullname" placeholder="Full Name" class="form-control" required>
            <input type="email" name="email" placeholder="Email Address" class="form-control" required>
            <input type="text" name="username" placeholder="Username" class="form-control" required>
            <input type="password" name="password" placeholder="Password" class="form-control" required>
            <input type="password" name="confirm_password" placeholder="Confirm Password" class="form-control" required>
            <button type="submit" class="btn">Register</button>
        </form>
        <a href="login.jsp">Already have an account? Login here</a>
 </div>
</body>
</html>