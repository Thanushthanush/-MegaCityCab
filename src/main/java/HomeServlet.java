import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// Define Servlet URL Mapping
@WebServlet("/home")
public class HomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<HashMap<String, String>> testimonials = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt1 = null;
        PreparedStatement stmt2 = null;
        ResultSet rs1 = null;
        ResultSet rs2 = null;

        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                // Step 1: Fetch comments from the comments table
                String sql1 = "SELECT id, userId, comment FROM comments ORDER BY created_at DESC LIMIT 3";
                stmt1 = conn.prepareStatement(sql1);
                rs1 = stmt1.executeQuery();

                // Prepare user details query outside the loop
                String sql2 = "SELECT fullname, image_url FROM users WHERE userId = ?"; // Use userId as the key
                stmt2 = conn.prepareStatement(sql2);

                while (rs1.next()) {
                    int commentId = rs1.getInt("id");
                    int userId = rs1.getInt("userId");
                    String comment = rs1.getString("comment");

                    // Step 2: Fetch user details using userId
                    stmt2.setInt(1, userId); // Using userId as the parameter
                    rs2 = stmt2.executeQuery();

                    String fullname = "Unknown"; // Default value if user not found
                    String imageUrl = "default.jpg"; // Default image

                    if (rs2.next()) {
                        fullname = rs2.getString("fullname");
                        imageUrl = rs2.getString("image_url");
                    }

                    // Step 3: Store data in a HashMap instead of using a Testimonial class
                    HashMap<String, String> testimonial = new HashMap<>();
                    testimonial.put("commentId", String.valueOf(commentId));
                    testimonial.put("userId", String.valueOf(userId));
                    testimonial.put("fullname", fullname);
                    testimonial.put("comment", comment);
                    testimonial.put("imageUrl", imageUrl);

                    testimonials.add(testimonial);

                    // Close rs2 after each iteration
                    if (rs2 != null) {
                        rs2.close();
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources properly
            try { if (rs1 != null) rs1.close(); } catch (SQLException ignored) {}
            try { if (stmt1 != null) stmt1.close(); } catch (SQLException ignored) {}
            try { if (stmt2 != null) stmt2.close(); } catch (SQLException ignored) {}
            try { if (conn != null) conn.close(); } catch (SQLException ignored) {}
        }

        // Send testimonials directly as request attributes
        for (int i = 0; i < testimonials.size(); i++) {
            request.setAttribute("testimonial" + (i + 1), testimonials.get(i));
        }

        // Forward request to home.jsp
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }
}
