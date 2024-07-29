package bus;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/buses", "root", "root");
            
            PreparedStatement ps = con.prepareStatement("SELECT role FROM users WHERE username=? AND password=?");
            ps.setString(1, username);
            ps.setString(2, password);
            
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String role = rs.getString("role");
                if ("passenger".equals(role)) {
                    // Redirect passenger to booking.jsp
                    response.sendRedirect("booking.jsp");
                } else if ("owner".equals(role)) {
                    // Redirect owner to viewTickets.jsp
                    response.sendRedirect("ViewTickets.jsp");
                } else {
                    out.print("Unknown role!");
                }
            } else {
                out.print("Invalid username or password!");
            }
        } catch (Exception e) {
            out.print("Error: " + e);
        }
    }
}



