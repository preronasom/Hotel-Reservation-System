<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Reservation</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="form-container">
        <h1>Find Reservation</h1>
        <form action="FetchReservationByIDServlet" method="post">
            <label for="reservationId">Enter Reservation ID:</label>
            <input type="number" id="reservationId" name="reservationId" required>
            <button type="submit">Fetch Details</button>
        </form>
    </div>
</body>
</html>
