import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    
    // Database connection details
    private static final String DB_URL = "jdbc:mysql://localhost:3306/cab_db";
    private static final String DB_USER = "root";  // Default user for WAMP
    private static final String DB_PASSWORD = "";  // Default password for WAMP (empty)
    
    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("Database Driver not found.", e);
        }
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }
}
