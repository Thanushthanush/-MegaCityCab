import com.megacitycab.model.TeamMember;

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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/AboutServlet")
public class AboutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<TeamMember> teamMembers = new ArrayList<>();
        
        try {
            Connection con = DBConnection.getConnection();
            String query = "SELECT name, post, image_url FROM team_members";
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                TeamMember member = new TeamMember();
                member.setName(rs.getString("name"));
                member.setPost(rs.getString("post"));
                member.setImageUrl(rs.getString("image_url"));
                teamMembers.add(member);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        request.setAttribute("teamMembers", teamMembers);
        request.getRequestDispatcher("about.jsp").forward(request, response);
    }
}
