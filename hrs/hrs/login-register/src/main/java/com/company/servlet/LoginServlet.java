package com.company.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import com.company.dao.UserDao;
import com.company.dao.UserDaoImpl;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static UserDao uesrDao = new UserDaoImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        String username = request.getParameter("username");
        String password = request.getParameter("password");
//        String role=request.getParameter("role");

        // Database connection
//        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
//            String query = "SELECT * FROM Users WHERE username = ? AND password = ?";
//            PreparedStatement stmt = conn.prepareStatement(query);
//            stmt.setString(1, username);
//            stmt.setString(2, password);
//
//            ResultSet rs = stmt.executeQuery();

            if (uesrDao.isValidUser(username,password)) {
                // Valid login
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                if(username.equals("root")) {
                	response.sendRedirect("adminDashboard.html");
                }
                else {
                	 response.sendRedirect("guestDashboard.jsp");
                }
//                session.setAttribute("role", role);
//                if (role == null) {
//                    	response.sendRedirect("guestDashboard.jsp");
//                    }
//                    else {
//                    	response.sendRedirect("adminDashboard.jsp");
//                    }
                    }
                    	
           else {
                // Invalid login
//                request.setAttribute("errorMessage", "Invalid username or password");
//                request.getRequestDispatcher("login.jsp").forward(request, response);
            	response.sendRedirect("login.jsp?error=1");
            	System.out.println("ERROR");
            }
//        } catch (Exception e) {
//            e.printStackTrace();
//            response.getWriter().println("Database connection error: " + e.getMessage());
//        }
	}

}
