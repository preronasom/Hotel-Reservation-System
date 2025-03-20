<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Reservation</title>
    <link rel="stylesheet" href="editstyle.css">
</head>
<body>
    <div class="form-container">
        <h1>Edit Reservation</h1>
        <form action="editServlet" method="post">
            <input type="hidden" name="id" value="<%= request.getAttribute("id") %>">
            
            <label for="fullname">Full Name:</label>
            <input type="text" id="fullname" name="fullname" value="<%= request.getAttribute("fullname") %>" required>
            
            <label for="phoneno">Phone Number:</label>
            <input type="text" id="phoneno" name="phoneno" value="<%= request.getAttribute("phoneno") %>" required>
            
            <label for="roomtype">Room Type:</label>
            <input type="text" id="roomtype" name="roomtype" value="<%= request.getAttribute("roomtype") %>" required>
            
            <label for="cin">Check-In Date:</label>
            <input type="date" id="cin" name="cin" value="<%= request.getAttribute("cin") %>" required>
            
            <label for="cout">Check-Out Date:</label>
            <input type="date" id="cout" name="cout" value="<%= request.getAttribute("cout") %>" required>
            
            <label for="requests">Special Requests</label>
            <input type="text" id="requests" name="requests" value="<%= request.getAttribute("requests") %>" required>
            
            
            <button type="submit">Update Reservation</button>
        </form>
    </div>
</body>
</html>
