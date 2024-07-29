<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Tickets</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h2>View Tickets</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Name</th>
                <th>From</th>
                <th>To</th>
                <th>Date</th>
                <th>Number of Tickets</th>
            </tr>
        </thead>
        <tbody>
            <% 
            try {
                // JDBC Connection parameters
                String url = "jdbc:mysql://localhost:3306/buses";
                String username = "root";
                String password = "root";

                // Load the MySQL JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish the database connection
                Connection con = DriverManager.getConnection(url, username, password);

                // SQL query to retrieve booking data from the database
                String query = "SELECT * FROM bookings";

                // Create a statement for executing SQL queries
                Statement stmt = con.createStatement();

                // Execute the SQL query and get the result set
                ResultSet rs = stmt.executeQuery(query);

                // Iterate through the result set and display booking data in the table
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("from_location") %></td>
                <td><%= rs.getString("to_location") %></td>
                <td><%= rs.getString("date") %></td>
                <td><%= rs.getInt("tickets") %></td>
            </tr>
            <% 
                }
                // Close the result set, statement, and database connection
                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            %>
        </tbody>
    </table>
</body>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    margin: 0;
    padding: 0;
}

h2 {
    text-align: center;
    margin-top: 20px;
    margin-bottom: 20px;
}

table {
    width: 80%;
    margin: 0 auto;
    border-collapse: collapse;
}

table, th, td {
    border: 1px solid #ddd;
}

th, td {
    padding: 10px;
    text-align: left;
}

th {
    background-color: #f2f2f2;
}

tr:nth-child(even) {
    background-color: #f9f9f9;
}

tr:hover {
    background-color: #f2f2f2;
}
</style>
</html>
