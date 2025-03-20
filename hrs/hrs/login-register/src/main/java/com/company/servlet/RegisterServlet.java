package com.company.servlet;

import java.io.IOException;

import com.company.dao.User;
import com.company.dao.UserDao;
import com.company.dao.UserDaoImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static UserDao uesrDao = new UserDaoImpl();
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    // JDBC connection details
//    private static final String DB_URL = "jdbc:mysql://localhost:3306/hotel_db";
//    private static final String DB_USER = "root";
//    private static final String DB_PASSWORD = "1234";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve user inputs from the form
    	//String role = request.getParameter("role");
    	String fullname = request.getParameter("fullname");
    	String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        User user =new User();
        //user.setFullname(role);
        user.setFullname(fullname);
        user.setEmail(email);
        user.setUsername(username);
        user.setPassword(password);

        if (uesrDao.addUser(user)) {
            response.sendRedirect("success.jsp"); // Redirect to dashboard
        } else {
          	response.sendRedirect("error.jsp");
        	//System.out.println("ERROR");
        }
        

        // Database connection
//        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
//            // SQL Insert Query
//            String query = "INSERT INTO users (fullname,email,username, password) VALUES (?, ?, ?, ?)";
//            PreparedStatement stmt = conn.prepareStatement(query);
//
//            // Setting parameters
//            stmt.setString(1, fullName);
//            stmt.setString(2, email);
//            stmt.setString(3, username);
//            stmt.setString(4,password);
//
//            // Execute the query
//            int rowsInserted = stmt.executeUpdate();
//
//            if (rowsInserted > 0) {
//                // Registration successful
//                response.sendRedirect("success.jsp"); // Redirect to a success page
//            } else {
//                // Registration failed
//                response.sendRedirect("error.jsp"); // Redirect to an error page
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//            response.getWriter().println("Database error: " + e.getMessage());
//        }
    }
}
