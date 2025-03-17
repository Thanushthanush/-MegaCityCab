<% 
    String successMessage = (String) request.getAttribute("successMessage");
    String errorMessage = (String) request.getAttribute("errorMessage");
%>

<!-- ? Sign In Modal -->
<div class="modal fade" id="signInModal" tabindex="-1" aria-labelledby="signInModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="signInModalLabel">Sign In</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Success/Error Messages -->
                <% if (successMessage != null) { %>
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <%= successMessage %>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                <% } else if (errorMessage != null) { %>
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <%= errorMessage %>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                <% } %>

                <!-- Sign In Form -->
                <form action="SignIn" method="post">
                    <div class="mb-3">
                        <label for="signin-username" class="form-label">Username</label>
                        <input type="text" class="form-control" name="username" id="signin-username" required>
                    </div>
                    <div class="mb-3">
                        <label for="signin-password" class="form-label">Password</label>
                        <input type="password" class="form-control" name="password" id="signin-password" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Sign In</button>
                </form>
                <hr>
                <p class="text-center">Don't have an account? 
                    <a href="#" data-bs-toggle="modal" data-bs-target="#signUpModal" onclick="switchModal('signInModal', 'signUpModal')">Sign Up</a>
                </p>
            </div>
        </div>
    </div>
</div>

<!-- ? Sign Up Modal -->
<div class="modal fade" id="signUpModal" tabindex="-1" aria-labelledby="signUpModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="signUpModalLabel">Sign Up</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Success/Error Messages -->
                <% if (successMessage != null) { %>
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <%= successMessage %>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                <% } else if (errorMessage != null) { %>
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <%= errorMessage %>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                <% } %>

                <!-- Sign Up Form -->
                <form action="SignUp" method="post">
                    <div class="mb-3">
                        <label for="signup-name" class="form-label">Full Name</label>
                        <input type="text" class="form-control" name="fullname" id="signup-name" required>
                    </div>
                    <div class="mb-3">
                        <label for="signup-NIC" class="form-label">NIC Number</label>
                        <input type="text" class="form-control" name="NIC" id="signup-NIC" required>
                    </div>
                    <div class="mb-3">
                        <label for="signup-gender" class="form-label">Gender</label>
                        <select class="form-control" name="gender" id="signup-gender" required>
                            <option value="">Select Gender</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="signup-address" class="form-label">Address</label>
                        <input type="text" class="form-control" name="address" id="signup-address" required>
                    </div>
                    <div class="mb-3">
                        <label for="signup-email" class="form-label">Email Address</label>
                        <input type="email" class="form-control" name="email" id="signup-email" required>
                    </div>
                    <div class="mb-3">
                        <label for="signup-phone" class="form-label">Phone No</label>
                        <input type="tel" class="form-control" name="phone" id="signup-phone" required>
                    </div>
                    <div class="mb-3">
                        <label for="signup-imageURL" class="form-label">Image URL</label>
                        <input type="text" class="form-control" name="imageURL" id="signup-imageURL" required>
                    </div>
                    <div class="mb-3">
                        <label for="signup-username" class="form-label">User Name</label>
                        <input type="text" class="form-control" name="username" id="signup-username" required>
                    </div>
                    <div class="mb-3">
                        <label for="signup-password" class="form-label">Password</label>
                        <input type="password" class="form-control" name="password" id="signup-password" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-100" id="formSubmitButton">Add User</button>
                </form>
                <hr>
                <p class="text-center">Do you have an account? 
                    <a href="#" data-bs-toggle="modal" data-bs-target="#signInModal" onclick="switchModal('signUpModal', 'signInModal')">Sign In</a>
                </p>
            </div>
        </div>
    </div>
</div>
