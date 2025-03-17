<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand" href="home.jsp">
            <i class="bi bi-car-front-fill"></i> Mega City Cab
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link text-white" href="index.jsp"><i class="bi bi-house-door"></i> Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="bookCab.jsp"><i class="bi bi-geo-alt"></i> Book a Cab</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="about.jsp"><i class="bi bi-info-circle"></i> About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="contact.jsp"><i class="bi bi-telephone"></i> Contact</a>
                </li>
                
               

                <!-- Check if user is logged in -->
                <%
                    String loggedInUser = (String) session.getAttribute("username");
                    if (loggedInUser != null) {
                %>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-white" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bi bi-person-circle"></i> <%= loggedInUser %>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                            <li><a class="dropdown-item" href="profile.jsp">Profile</a></li>
                            <li><a class="dropdown-item" href="logout.jsp">Logout</a></li>
                        </ul>
                    </li>
                <%
                    } else {
                %>
                    <!-- Show Sign In Button if not logged in -->
                    <li class="nav-item">
                        <button class="btn btn-light text-primary fw-bold" data-bs-toggle="modal" data-bs-target="#signInModal">
                            <i class="bi bi-person-circle"></i> Sign in/Sign up
                        </button>
                    </li>
                <%
                    }
                %>
            </ul>
        </div>
    </div>
</nav>


<!-- Include Sign In/Sign Up Modals -->
<jsp:include page="signIn.jsp" />
