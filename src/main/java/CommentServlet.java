import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        // Check if session exists
        if (session == null) {
            request.setAttribute("errorMessage", "Session expired. Please log in again.");
            request.getRequestDispatcher("signIn.jsp").forward(request, response);
            return;
        }

        // Retrieve username from session
        String username = (String) session.getAttribute("username");
        if (username == null) {
            request.setAttribute("errorMessage", "You must be logged in to submit a comment.");
            request.getRequestDispatcher("signIn.jsp").forward(request, response);
            return;
        }

        // Fetch user_id from the database using the username
        int userId = getUserIdByUsername(username);
        if (userId == -1) {
            request.setAttribute("errorMessage", "Failed to retrieve user details.");
            request.getRequestDispatcher("contact.jsp").forward(request, response);
            return;
        }

        // Retrieve input values
        String email = request.getParameter("email");
        String comment = request.getParameter("message"); 

        // Validate input fields
        if (email == null || comment == null || email.trim().isEmpty() || comment.trim().isEmpty()) {
            request.setAttribute("errorMessage", "All fields are required!");
            request.getRequestDispatcher("contact.jsp").forward(request, response);
            return;
        }

        // Get current timestamp
        Timestamp createdAt = new Timestamp(System.currentTimeMillis());

        // Insert comment into the database
        try (Connection conn = DBConnection.getConnection()) {
            if (conn == null) {
                request.setAttribute("errorMessage", "Database connection failed.");
                request.getRequestDispatcher("contact.jsp").forward(request, response);
                return;
            }

            String sql = "INSERT INTO comments (user_id, email, comment, created_at) VALUES (?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, userId);
                stmt.setString(2, email);
                stmt.setString(3, comment);
                stmt.setTimestamp(4, createdAt);

                int rowsInserted = stmt.executeUpdate();
                if (rowsInserted > 0) {
                    request.setAttribute("successMessage", "Comment submitted successfully!");
                } else {
                    request.setAttribute("errorMessage", "Failed to save comment.");
                }
            }
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
        }

        // Forward back to contact page
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    // Helper method to retrieve user_id using the username
    private int getUserIdByUsername(String username) {
        int userId = -1;
        try (Connection conn = DBConnection.getConnection()) {
            if (conn != null) {
                String sql = "SELECT id FROM users WHERE username = ?";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, username);
                    try (ResultSet rs = stmt.executeQuery()) {
                        if (rs.next()) {
                            userId = rs.getInt("id");
                        }
                    }
                }
            }
        } catch (SQLException e) {
            System.err.println("Error fetching user_id: " + e.getMessage());
        }
        return userId;
    }
}
