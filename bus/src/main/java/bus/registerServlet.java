package bus;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/registerServlet")
public class registerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/buses", "root", "root");
            
            PreparedStatement ps = con.prepareStatement("insert into users values(?,?,?)");
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, role);
            
            int i = ps.executeUpdate();
            if (i > 0) {
                response.sendRedirect("login.jsp"); // Redirect to login page
            }
        } catch (Exception e) {
            out.print("Error: " + e);
        }
    }
}


