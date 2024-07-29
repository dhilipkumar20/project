<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking Confirmation</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <div class="container">
        <div class="container1">
            <h2>Booking Confirmation</h2>
        </div>
        <div class="confirmation-details">
            <p><strong>Name:</strong> <%= request.getParameter("name") %></p>
            <p><strong>From:</strong> <%= request.getParameter("from") %></p>
            <p><strong>To:</strong> <%= request.getParameter("to") %></p>
            <p><strong>Destination:</strong> <%= request.getParameter("destination") %></p>
            <p><strong>Date:</strong> <%= request.getParameter("date") %></p>
            <p><strong>Number of Tickets:</strong> <%= request.getParameter("tickets") %></p>
            <p>Your ticket(s) have been successfully booked. Thank you!</p>
        </div>
        <div class="btn-container">
            <button id="cancelBtn">Cancel Ticket</button>
        </div>
    </div>

    <script>
        document.getElementById("cancelBtn").addEventListener("click", function() {
            var confirmed = confirm("Are you sure you want to cancel the ticket?");
            if (confirmed) {
                // Send AJAX request to cancel the ticket
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "CancelTicketServlet", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.onreadystatechange = function() {
                    if (xhr.readyState == 4 && xhr.status == 200) {
                        // Handle response from server
                        alert(xhr.responseText); // Show response message (e.g., Ticket canceled successfully)
                        // Optionally, reload the page or redirect to another page
                        // window.location.reload();
                        // window.location.href = "viewTickets.jsp";
                    }
                };
                xhr.send();
            }
        });
    </script>
</body>
<style>
/* General styling for the container */
.container {
    max-width: 600px;
    margin: 50px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

/* Styling for the heading container */
.container1 {
    background-color: #4CAF50; /* Green color */
    color: #fff; /* White text color */
    padding: 20px;
    border-radius: 5px;
    text-align: center;
}

/* Styling for the confirmation details */
.confirmation-details {
    margin-top: 30px;
}

.confirmation-details p {
    margin: 10px 0;
}

/* Styling for the cancel button container */
.btn-container {
    text-align: center;
    margin-top: 20px;
}

/* Styling for the cancel button */
#cancelBtn {
    padding: 10px 20px;
    background-color: #ff4444; /* Red color */
    color: #fff; /* White text color */
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

#cancelBtn:hover {
    background-color: #cc0000; /* Darker red color on hover */
}
</style>
</html>
