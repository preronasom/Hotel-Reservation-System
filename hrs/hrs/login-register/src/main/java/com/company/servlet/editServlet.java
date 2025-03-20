package com.company.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/editServlet")
public class editServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:mysql://localhost:3306/hotel_db";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "1234";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String fullname = request.getParameter("fullname");
        String phoneno = request.getParameter("phoneno");
        String roomtype = request.getParameter("roomtype");
        String cin = request.getParameter("cin");
        String cout = request.getParameter("cout");
        String requests = request.getParameter("requests");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String query = "UPDATE reservation SET fullname = ?, phoneno = ?, roomtype = ?, cin = ?, cout = ?, requests = ? WHERE gid = ?";
            PreparedStatement pstmt = con.prepareStatement(query);

            pstmt.setString(1, fullname);
            pstmt.setString(2, phoneno);
            pstmt.setString(3, roomtype);
            pstmt.setString(4, cin);
            pstmt.setString(5, cout);
            pstmt.setInt(6, id);
            pstmt.setString(5, requests);

            int rowsUpdated = pstmt.executeUpdate();

            if (rowsUpdated > 0) {
                response.getWriter().println("Reservation updated successfully!");
            } else {
                response.getWriter().println("Failed to update reservation.");
            }

            pstmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        }
    }
}
