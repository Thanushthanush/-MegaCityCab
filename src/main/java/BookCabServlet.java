import com.megacitycab.model.Places;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/BookCabServlet")
public class BookCabServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Places> placeList = new ArrayList<>();
        
        try (Connection conn = DBConnection.getConnection()) {
            if (conn == null) {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database connection error.");
                return;
            }

            String placeSql = "SELECT * FROM places";
            try (PreparedStatement placeStmt = conn.prepareStatement(placeSql);
                 ResultSet placeRs = placeStmt.executeQuery()) {
                while (placeRs.next()) {
                    placeList.add(new Places(
                            placeRs.getInt("id"),
                            placeRs.getString("place_name")));
                }
            }

            request.setAttribute("placeList", placeList);
            request.getRequestDispatcher("bookCab.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error: " + e.getMessage());
        }
    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    
            int userId = Integer.parseInt(request.getParameter("userId"));
            int driverId = Integer.parseInt(request.getParameter("driverId"));
            String pickupLocation = request.getParameter("pickupLocation");
            String dropoffLocation = request.getParameter("dropoffLocation");
            String cabType = request.getParameter("cabType");
            double distance = Double.parseDouble(request.getParameter("distance"));
            double price = Double.parseDouble(request.getParameter("price"));
            double tax = Double.parseDouble(request.getParameter("tax"));
            double discount = Double.parseDouble(request.getParameter("discount"));
            double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
            String status = request.getParameter("status");
            
            Date rideDate = Date.valueOf(request.getParameter("rideDate"));
            String rideTimeStr = request.getParameter("rideTime");
            if (rideTimeStr.matches("\\d{2}:\\d{2}")) {
                rideTimeStr += ":00"; // Append seconds if not provided
            }
            Time rideTime = Time.valueOf(rideTimeStr);
            
            try (Connection conn = DBConnection.getConnection()) {
                if (conn == null) {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database connection error.");
                    return;
                }
                
                String sql = "INSERT INTO bookings (userId, driverId, pickupLocation, dropoffLocation, rideDate, rideTime, cabType, distance, price, tax, discount, totalPrice, status, createdAt) " +
                             "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setInt(1, userId);
                    stmt.setInt(2, driverId);
                    stmt.setString(3, pickupLocation);
                    stmt.setString(4, dropoffLocation);
                    stmt.setDate(5, rideDate);
                    stmt.setTime(6, rideTime);
                    stmt.setString(7, cabType);
                    stmt.setDouble(8, distance);
                    stmt.setDouble(9, price);
                    stmt.setDouble(10, tax);
                    stmt.setDouble(11, discount);
                    stmt.setDouble(12, totalPrice);
                    stmt.setString(13, status);
                    stmt.setTimestamp(14, new Timestamp(System.currentTimeMillis()));

                    if (stmt.executeUpdate() > 0) {
                        response.sendRedirect("ManageBookingServlet");
                    } else {
                        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to add booking.");
                    }
                }
            
        } catch (SQLException | NumberFormatException e) { // Log error
            // Log error
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Error processing request: " + e.getMessage());
        }
    }
}

