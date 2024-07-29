package bus;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/BookingTicketServlet")
public class BookingTicketServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String name = request.getParameter("name");
        String from = request.getParameter("from");
        String to = request.getParameter("to");
        String date = request.getParameter("date");
        int tickets = Integer.parseInt(request.getParameter("tickets"));
        
        // JDBC Connection parameters
        String url = "jdbc:mysql://localhost:3306/buses";
        String username = "root";
        String password = "root";
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, username, password);
            
            PreparedStatement ps = con.prepareStatement("INSERT INTO bookings (name, from_location, to_location, date, tickets) VALUES (?, ?, ?, ?, ?)");
            ps.setString(1, name);
            ps.setString(2, from);
            ps.setString(3, to);
            ps.setString(4, date);
            ps.setInt(5, tickets);
            
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                out.println("<h2>Booking Successful!</h2>");
                out.println("<p>Name: " + name + "</p>");
                out.println("<p>From: " + from + "</p>");
                out.println("<p>To: " + to + "</p>");
                out.println("<p>Date: " + date + "</p>");
                out.println("<p>Number of Tickets: " + tickets + "</p>");
            } else {
                out.println("<h2>Booking Failed!</h2>");
            }
        } catch (Exception e) {
            out.println("Error: " + e);
        }
    }
}
