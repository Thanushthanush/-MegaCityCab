import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import static java.lang.System.out;

@WebServlet("/SignIn")
public class SignInServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(SignInServlet.class.getName());

    // Database connection details
    private static final String DB_URL = "jdbc:mysql://localhost:3306/cab_db";
    private static final String DB_USER = "root";  // Default user for WAMP
    private static final String DB_PASSWORD = "";  // Default password for WAMP (empty)

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            // Load JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {

                // Query to check if user exists
                String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, username);
                    stmt.setString(2, password);  // Consider hashing the password

                    try (ResultSet rs = stmt.executeQuery()) {
                        if (rs.next()) {
                            // Authentication successful, create session
                            HttpSession session = request.getSession();
                            session.setAttribute("username", username);
                            
                            // ✅ Show success popup and redirect
                            out.println("<script type='text/javascript'>");
                            out.println("alert('✅ Account Login successfully!');");                           
                            out.println("</script>");
                        
                            response.sendRedirect("index.jsp");  // Redirect to home page after login
                        } else {
                            // Invalid credentials
                            response.sendRedirect("signIn.jsp?error=Invalid credentials");
                        }
                    }
                }
            }
        } catch (ClassNotFoundException e) {
            LOGGER.log(Level.SEVERE, "MySQL JDBC Driver not found", e);
            response.sendRedirect("signIn.jsp?error=Database driver not found");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Database error", e);
            response.sendRedirect("signIn.jsp?error=Server error");
        }
    }
}
