<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, jakarta.servlet.http.*, jakarta.servlet.*, java.io.*" %>

<%@page import="com.megacitycab.model.User"%>

<%
    // Ensure user is logged in
    User loggedInUser = (User) session.getAttribute("user");
    if (loggedInUser == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <title>User Profile</title>
</head>
<body>

    <!-- Include Navbar -->
    <jsp:include page="navbar.jsp" />

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow-lg">
                    <div class="card-header text-center bg-primary text-white">
                        <h4>User Profile</h4>
                    </div>
                    <div class="card-body">
                        <p><strong>Full Name:</strong> <%= loggedInUser.getFullname() %></p>
                        <p><strong>Gender:</strong> <%= loggedInUser.getGender() %></p>
                        <p><strong>Address:</strong> <%= loggedInUser.getAddress() %></p>
                        <p><strong>Email:</strong> <%= loggedInUser.getEmail() %></p>
                        <p><strong>Phone No:</strong> <%= loggedInUser.getPhone() %></p>
                        <p><strong>Username:</strong> <%= loggedInUser.getUsername() %></p>
                        <button class="btn btn-primary w-100" data-bs-toggle="modal" data-bs-target="#profileModal">Edit Profile</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit Profile Modal -->
    <div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="profileModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="profileModalLabel">Edit Profile</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="ProfileServlet" method="post">
                        <input type="hidden" name="userId" value="<%= loggedInUser.getId() %>">
                        <div class="mb-3">
                            <label class="form-label">Full Name</label>
                            <input type="text" class="form-control" name="fullname" value="<%= loggedInUser.getFullname() %>" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Gender</label>
                            <select class="form-control" name="gender" required>
                                <option value="Male" <%= "Male".equals(loggedInUser.getGender()) ? "selected" : "" %>>Male</option>
                                <option value="Female" <%= "Female".equals(loggedInUser.getGender()) ? "selected" : "" %>>Female</option>
                                <option value="Other" <%= "Other".equals(loggedInUser.getGender()) ? "selected" : "" %>>Other</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Address</label>
                            <input type="text" class="form-control" name="address" value="<%= loggedInUser.getAddress() %>" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" class="form-control" name="email" value="<%= loggedInUser.getEmail() %>" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Phone No</label>
                            <input type="tel" class="form-control" name="phone" value="<%= loggedInUser.getPhone() %>" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Username</label>
                            <input type="text" class="form-control" name="username" value="<%= loggedInUser.getUsername() %>" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">New Password (leave blank to keep current password)</label>
                            <input type="password" class="form-control" name="password">
                        </div>
                        <button type="submit" class="btn btn-success w-100">Update Profile</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>