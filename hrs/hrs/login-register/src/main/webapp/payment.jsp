<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Room Reservation Payment</title>
    <link rel="stylesheet" href="paymentstyle.css">
</head>
<body>
    <div class="payment-container">
        <h1>Payment for Room Reservation</h1>
        <p>Please fill in your payment details to complete the reservation.</p>
        <form class="payment-form" method=post>
            <label for="name">Name on Card</label>
            <input type="text" id="name" placeholder="Enter your full name" required>

            <label for="card-number">Card Number</label>
            <input type="text" id="card-number" placeholder="1234 5678 9012 3456" required>

            <label for="expiry">Expiry Date</label>
            <input type="month" id="expiry" required>

            <label for="cvv">CVV</label>
            <input type="text" id="cvv" placeholder="123" required>

            <!-- <button type="submit" class="btn">Make Payment</button>-->
            <a href="reservationSucess.jsp" class="btn">Make payment</a>
        </form>
    </div>
</body>
</html>
