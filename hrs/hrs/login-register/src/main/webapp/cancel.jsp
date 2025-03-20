<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.DriverManager" %>
    <%@ page import="java.sql.Statement"%>
   <%@ page import="java.sql.*" %>
  <%@ page import="java.io.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Reservation</title>
        <link rel="stylesheet" href="cancelstyle.css">
</head>
<body>
        <div class="container">
        <h2>Delete Reservation</h2>
        <!-- Email Input Form -->
        <form method="post">
            <label for="email" class="em">Enter Email:</label>
            <input type="text" id="email" name="email" placeholder="Enter your email" required>
            <button type="submit" id="cbtn" onclick="return confirm('Are you sure you want to delete this reservation?')">Cancel Booking</button>
        </form>
        
        <%
        // Retrieve the email from the request
        String email = request.getParameter("email");

        if (email != null && !email.trim().isEmpty()) {
            Connection con = null;
            PreparedStatement checkStmt = null;
            PreparedStatement deleteStmt = null;
            ResultSet rs = null;
            try {
                // Database connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel_db", "root", "1234");

                // Check if a reservation exists for the provided email
                String checkQuery = "SELECT * FROM reservation WHERE email = ?";
                checkStmt = con.prepareStatement(checkQuery);
                checkStmt.setString(1, email);
                rs = checkStmt.executeQuery();

                if (rs.next()) {
                    // Delete the reservation
                    String deleteQuery = "DELETE FROM reservation WHERE email = ?";
                    deleteStmt = con.prepareStatement(deleteQuery);
                    deleteStmt.setString(1, email);
                    int rowsDeleted = deleteStmt.executeUpdate();

                    if (rowsDeleted > 0) {
                        %>
                        <div class="message success">Booking canceled successfully for email: <%= email %>.</div>
                        <%
                    } else {
                        %>
                        <div class="message error">Error: Unable to delete reservation for email: <%= email %>.</div>
                        <%
                    }
                } else {
                    %>
                    <div class="message error">No reservation found for the provided email: <%= email %>.</div>
                    <%
                }
            } catch (Exception e) {
                %>
                <div class="message error">Error: <%= e.getMessage() %>.</div>
                <%
                e.printStackTrace();
            } finally {
                // Close resources
                if (rs != null) try { rs.close(); } catch (SQLException ignored) {}
                if (checkStmt != null) try { checkStmt.close(); } catch (SQLException ignored) {}
                if (deleteStmt != null) try { deleteStmt.close(); } catch (SQLException ignored) {}
                if (con != null) try { con.close(); } catch (SQLException ignored) {}
            }
        }
        %>
    </div>
</body>
</html>