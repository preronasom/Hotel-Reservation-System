<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Reservation Form</title>
    <link rel="stylesheet" href="reservationroomstyle.css">
</head>
<body>
    <div class="reservation-form">
        <h1>Hotel Reservation Form</h1>
        <form action="reservationRoomServlet" method="post">
            <!-- Personal Details -->
            <div class="form-group">
                <label for="fullname">Full Name</label>
                <input type="text" id="fullname" name="fullname" placeholder="Enter your full name" required>
            </div>

            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" required>
            </div>

            <div class="form-group">
                <label for="phoneno">Phone Number</label>
                <input type="tel" id="phoneno" name="phoneno" placeholder="Enter your phone number" required>
            </div>

            <!-- Reservation Details -->
            <div class="form-group">
                <label for="roomtype">Room Type</label>
                <select id="roomtype" name="roomtype" required>
                    <option value="single">Single Room</option>
                    <option value="double">Double Room</option>
                    <option value="suite">Suite</option>
                </select>
            </div>

            <div class="form-group">
                <label for="cin">Check-In Date</label>
                <input type="date" id="cin" name="cin" required>
            </div>

            <div class="form-group">
                <label for="cout">Check-Out Date</label>
                <input type="date" id="cout" name="cout" required>
            </div>

            <!-- Special Requests -->
            <div class="form-group">
                <label for="requests">Special Requests</label>
                <textarea id="requests" name="requests" placeholder="Enter any special requests"></textarea>
            </div>

            <!-- Submit Button -->
            <div class="form-group">
                <button type="submit" class="submit-btn">Reserve Now</button>
            </div>
        </form>
    </div>
</body>
</html>
