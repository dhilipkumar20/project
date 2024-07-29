
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration</title>
</head>
<body>
    <h2>User Registration</h2>
    <form action=" registerServlet" method="post">
        <label for="username">Username:</label><br>
        <input type="text" id="username" name="username" required><br><br>
        
        <label for="password">Password:</label><br>
        <input type="password" id="password" name="password" required><br><br>
        
        <label for="role">Role:</label><br>
        <input type="checkbox" id="owner" name="role" value="owner">
        <label for="owner">Owner</label><br>
        <input type="checkbox" id="passenger" name="role" value="passenger">
        <label for="passenger">Passenger</label><br><br>
        
        <input type="submit" value="Register">
         <p>Already have an account? <a href="login.jsp">Login</a></p>
    </form>
</body>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
}

h2 {
    color: #333;
    text-align:center;
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
input[type="password"] {
    width: calc(100% - 20px);
    padding: 8px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
}

input[type="checkbox"] {
    margin-top: 5px;
    margin-bottom: 10px;
}

input[type="submit"] {
    width: 40%;
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
