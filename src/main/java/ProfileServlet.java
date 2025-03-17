
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.ResultSet;

@WebServlet(urlPatterns = {"/ProfileServlet"})
public class ProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId;
        try {
            userId = Integer.parseInt(request.getParameter("userId"));
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid user ID.");
            return;
        }

        String fullname = request.getParameter("fullname");
        String NIC = request.getParameter("NIC");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String imageURL = request.getParameter("imageURL");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (fullname == null || email == null || username == null || NIC == null ||
            fullname.isEmpty() || email.isEmpty() || username.isEmpty() || NIC.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing required fields.");
            return;
        }

        try (Connection conn = DBConnection.getConnection()) { 
             // Check if the new username is already taken by another admin
            String checkSql = "SELECT id FROM users WHERE username = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkSql);
            checkStmt.setString(1, username);
            ResultSet rs = checkStmt.executeQuery();
            
            if (rs.next()) {
                int existingUserId = rs.getInt("id");
                if (existingUserId != userId) { // If the ID is different, username is taken
                    response.sendError(HttpServletResponse.SC_CONFLICT, "Username already exists.");
                    return;
                }
            }            
            String sql = "UPDATE users SET fullname=?, NIC=?, gender=?, address=?, email=?, phone=?, imageURL=?, username=?, password=? WHERE id=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, fullname);
            stmt.setString(2, NIC);
            stmt.setString(3, gender);
            stmt.setString(4, address);
            stmt.setString(5, email);
            stmt.setString(6, phone);
            stmt.setString(7, imageURL);
            stmt.setString(8, username);
            stmt.setString(9, password);
            stmt.setInt(10, userId);

            stmt.executeUpdate();
            response.sendRedirect("index.jsp");
        } catch (SQLException e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error.");
        }
    }
    
    
}