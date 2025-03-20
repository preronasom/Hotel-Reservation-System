package com.company.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/FetchReservationByIDServlet")
public class FetchReservationByIDServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:mysql://localhost:3306/hotel_db";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "1234";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int gid = Integer.parseInt(request.getParameter("gid"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String query = "SELECT * FROM reservation WHERE gid = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, gid);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                // Pass reservation details to JSP
                request.setAttribute("gid", rs.getInt("gid"));
                request.setAttribute("email", rs.getString("email"));
                request.setAttribute("fullname", rs.getString("fullname"));
                request.setAttribute("phoneno", rs.getString("phoneno"));
                request.setAttribute("roomtype", rs.getString("roomtype"));
                request.setAttribute("cin", rs.getString("cin"));
                request.setAttribute("cout", rs.getString("cout"));
                request.setAttribute("requests", rs.getString("requests"));
                request.getRequestDispatcher("editreservation.jsp").forward(request, response);
            } else {
                response.getWriter().println("No reservation found for the provided ID.");
            }

            pstmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        }
    }
}
