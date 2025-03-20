<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.DriverManager" %>
    <%@ page import="java.sql.Statement"%>
    <%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Get Room Number</title>
    <link rel="stylesheet" href="getnostyle.css">
</head>
<body>
<table border="1">
<tr>

     
      <th>room no.</th>
</tr>

<%try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel_db","root","1234");
            Statement st = con.createStatement();
            
            	%>
            	<% 
                // Loop to generate random numbers
                Random random = new Random();
        int roomNo = 100 + random.nextInt(20);
             %>
             <tr>
             <td>
             <%= roomNo %>
             </td>
            	<%
            
            
            }catch (Exception e){
            
        } %>
        </tr>
        </table>
    
        <a href="guestDashboard.jsp" class="back-btn">Back to Dashboard</a>
    
</body>
</html>
