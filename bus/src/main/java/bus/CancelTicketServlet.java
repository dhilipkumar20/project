package bus;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/CancelTicketServlet")
public class CancelTicketServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        // Get the booking ID from the hidden input field in the form
        int bookingId = Integer.parseInt(request.getParameter("booking_id"));
        
        // JDBC Connection parameters
        String url = "jdbc:mysql://localhost:3306/buses";
        String username = "root";
        String password = "root";
        
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the database connection
            Connection con = DriverManager.getConnection(url, username, password);

            // SQL query to cancel the ticket (update the database)
            String query = "DELETE FROM bookings WHERE booking_id=?";
            
            // Create a PreparedStatement for executing SQL queries with parameters
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, bookingId);
            
            // Execute the SQL query to cancel the ticket
            int rowsAffected = pstmt.executeUpdate();
            
            if (rowsAffected > 0) {
                out.println("<h2>Ticket Cancellation Successful!</h2>");
            } else {
                out.println("<h2>Ticket Cancellation Failed!</h2>");
            }
            
            // Close the PreparedStatement and database connection
            pstmt.close();
            con.close();
            
            // Redirect back to viewTickets.jsp
            response.sendRedirect("viewTickets.jsp");
        } catch (Exception e) {
            out.println("Error: " + e);
        }
    }
}

