<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="loginStyle.css">
</head>
<body>
<div class="login-container">
        <h2>Login</h2>
        <form action="LoginServlet" method="post">
            <input type="radio" name="role" id="admin" placeholder="Role" class="radio-inline" value="Admin" required>
            <label for="admin">admin</label>
            <input type="radio" name="role" id="guest" placeholder="Role" class="radio-inline" value="Guest" required>
            <label for="guest">guest</label>
            <input type="text" name="username" placeholder="Username" class="form-control" required>
            <input type="password" name="password" placeholder="Password" class="form-control" required>
            <button type="submit" class="btn">Login</button>
        </form>
        <a href="register.jsp">Don't have an account? Register here</a>
        <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
<% if (errorMessage != null) { %>
    <p style="color: red;"><%= errorMessage %></p>
<% } %>
    </div>
</body>
</html>