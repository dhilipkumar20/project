<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Tickets</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
     <script>
        function validateForm() {
            var name = document.getElementById("name").value;
            var from = document.getElementById("from").value;
            var to = document.getElementById("to").value;
            var date = document.getElementById("date").value;
            var tickets = document.getElementById("tickets").value;

            if (name == "" || from == "" || to == "" || date == "" || tickets == "") {
                alert("All fields are required");
                return false;
            }

            if (isNaN(tickets) || tickets <= 0) {
                alert("Number of tickets must be a positive number");
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <h2>Book Tickets</h2>
    <form action=" confirmation.jsp" method="post">
        <label for="name">Name:</label><br>
        <input type="text" id="name" name="name" required><br><br>
        
        <label for="from">From:</label><br>
        <input type="text" id="from" name="from" required><br><br>
        
        <label for="to">To:</label><br>
        <input type="text" id="to" name="to" required><br><br>
        
        
        <label for="date">Date:</label><br>
        <input type="date" id="date" name="date" required><br><br>
        
        <label for="tickets">Number of Tickets:</label><br>
        <input type="number" id="tickets" name="tickets" min="1" required><br><br>
        
        <input type="submit" value="Book">
    </form>
</body>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
}

h2 {
text-align:center;
    color: #333;
}

form {
    width: 300px;
    margin: 0 auto;
    background-color: #fff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

label {
    display: block;
    margin-bottom: 5px;
    color: #333;
}

input[type="text"],
input[type="number"],
input[type="date"] {
    width: calc(100% - 20px);
    padding: 8px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
}

input[type="submit"] {
    width: 100%;
    background-color: #007bff;
    color: #fff;
    padding: 10px;
    border: none;
    border-radius: 3px;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}
</style>
</html>
