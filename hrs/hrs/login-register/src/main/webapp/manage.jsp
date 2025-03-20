<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Bookings</title>
    <link rel="stylesheet" href="managestyle.css">
</head>
<body>
    <div class="container">
        <h1>Manage Bookings</h1>
        <form method="get" action="manage.jsp">
            <label for="search">Search Reservations:</label>
            <input type="text" id="search" name="search" placeholder="Enter Reservation ID, Email, or Name" value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">
            <button type="submit">Search</button>
        </form>

        <table border="1">
            <thead>
                <tr>
                    <th>Reservation ID</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th>Room Type</th>
                    <th>Check-In</th>
                    <th>Check-Out</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    String searchQuery = request.getParameter("search");
                    Connection con = null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel_db", "root", "1234");

                        // Base query
                        String query = "SELECT * FROM reservation";

                        // If search query exists, add WHERE clause
                        if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                            query += " WHERE gid LIKE ? OR email LIKE ? OR fullname LIKE ?";
                            stmt = con.prepareStatement(query);
                            stmt.setString(1, "%" + searchQuery + "%");
                            stmt.setString(2, "%" + searchQuery + "%");
                            stmt.setString(3, "%" + searchQuery + "%");
                        } else {
                            stmt = con.prepareStatement(query);
                        }

                        rs = stmt.executeQuery();

                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("gid") %></td>
                    <td><%= rs.getString("fullname") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getString("phoneno") %></td>
                    <td><%= rs.getString("roomtype") %></td>
                    <td><%= rs.getString("cin") %></td>
                    <td><%= rs.getString("cout") %></td>
                    <td>
                        <a href="editreservation.jsp ">Edit</a> |
                        <a href="cancel.jsp " onclick="return confirm('Are you sure you want to delete this reservation?');">Delete</a>
                    </td>
                </tr>
                <% 
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                        out.println("<tr><td colspan='8'>Error fetching reservations.</td></tr>");
                    } finally {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (con != null) con.close();
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
