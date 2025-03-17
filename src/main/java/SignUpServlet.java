import com.megacitycab.model.User;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SignUp")
public class SignUpServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullname = request.getParameter("fullname");
        String NIC = request.getParameter("NIC");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String imageURL = request.getParameter("imageURL");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (fullname == null || fullname.isEmpty() || 
            NIC == null || NIC.isEmpty() || 
            gender == null || gender.isEmpty() || 
            address == null || address.isEmpty() || 
            email == null || email.isEmpty() || 
            phone == null || phone.isEmpty() || 
            imageURL == null || imageURL.isEmpty() || 
            username == null || username.isEmpty() || 
            password == null || password.isEmpty()) {
            
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing required fields.");
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {
            // Check if username, email, or NIC already exists
            String checkSql = "SELECT COUNT(*) FROM users WHERE username = ? OR email = ? OR NIC = ?";
            try (PreparedStatement checkStmt = conn.prepareStatement(checkSql)) {
                checkStmt.setString(1, username);
                checkStmt.setString(2, email);
                checkStmt.setString(3, NIC);
                try (ResultSet rs = checkStmt.executeQuery()) {
                    rs.next();
                    if (rs.getInt(1) > 0) {
                        response.sendError(HttpServletResponse.SC_CONFLICT, "Username, email, or NIC already exists.");
                        return;
                    }
                }
            }

           

            // Insert user
            String sql = "INSERT INTO users (fullname, NIC, gender, address, email, phone, imageURL, username, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, fullname);
                stmt.setString(2, NIC);
                stmt.setString(3, gender);
                stmt.setString(4, address);
                stmt.setString(5, email);
                stmt.setString(6, phone);
                stmt.setString(7, imageURL);
                stmt.setString(8, username);
                stmt.setString(9, password);

                int rowsInserted = stmt.executeUpdate();
                if (rowsInserted > 0) {
                    request.setAttribute("successMessage", "Registration successful! Please log in.");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } else {
                    request.setAttribute("errorMessage", "User registration failed.");
                    request.getRequestDispatcher("signup.jsp").forward(request, response);
                }

            }
        } catch (SQLException e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error.");
        }
    }
}
