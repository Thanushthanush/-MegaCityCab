<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <title>Mega City Cab</title>
</head>
<body>
    <!-- Include Navbar -->
    <jsp:include page="navbar.jsp" />

    <!-- Page Content Container -->
    <div class="container mt-4">
        <div id="pageContent">
            <!-- Home Page Content -->
            <div id="content">
                <header class="text-white text-center d-flex align-items-center justify-content-center" 
                        style="background: url('https://www.shutterstock.com/image-vector/blue-car-smartphone-route-points-600nw-1483969718.jpg') no-repeat center center; 
                               background-size: cover; 
                               height: 80vh;">
                    <div class="container">
                        <h1 class="fw-bold display-3" style="text-shadow: 1px 8px 10px black;">Welcome to Mega City Cab</h1>
                        <p class="lead fs-4" style="text-shadow: 1px 5px 10px black;">Book a cab in seconds, ride in comfort.</p>
                        <a href="bookCab.jsp" class="btn btn-light btn-lg text-primary fw-bold">
                            <i class="bi bi-car-front-fill"></i> Book a Ride
                        </a>
                    </div>
                </header>



                <!-- Features Section -->
                <section class="container mt-5">
                    <div class="row text-center">
                        <div class="col-md-4">
                            <i class="bi bi-clock-history text-primary" style="font-size: 3rem;"></i>
                            <h4 class="mt-3">24/7 Service</h4>
                            <p>Book a ride anytime, anywhere in Colombo.</p>
                        </div>
                        <div class="col-md-4">
                            <i class="bi bi-shield-lock text-success" style="font-size: 3rem;"></i>
                            <h4 class="mt-3">Safe & Reliable</h4>
                            <p>Verified drivers and secure payments.</p>
                        </div>
                        <div class="col-md-4">
                            <i class="bi bi-geo-alt text-danger" style="font-size: 3rem;"></i>
                            <h4 class="mt-3">Quick Pickup</h4>
                            <p>Find a cab near you instantly.</p>
                        </div>
                    </div>
                </section>

                <!-- Call to Action Section -->
                <section class="bg-primary text-white text-center py-5 mt-5">
                    <div class="container">
                        <h2 class="fw-bold">Ready to Ride?</h2>
                        <p>Book your cab now and enjoy a comfortable journey.</p>
                        <a href="bookCab.jsp" class="btn btn-light text-primary btn-lg fw-bold">
                            <i class="bi bi-geo-alt"></i> Book Now
                        </a>
                    </div>
                </section>

                <!-- Footer Section -->
                <footer class="bg-dark text-white text-center py-3">
                    <p>&copy; 2025 Mega City Cab. All Rights Reserved.</p>
                </footer>
            </div>
        </div>
    </div>

    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- jQuery AJAX Navigation -->
    <script>
        $(document).ready(function() {
            $(document).on("click", ".nav-link", function(e) {
                e.preventDefault();  // Prevent default link behavior
                
                let page = $(this).attr("href");  // Get target page (e.g., "about.jsp")

                // Load only content inside #content
                $("#pageContent").fadeOut(200, function() {
                    $("#pageContent").load(page + " #content", function() {
                        $("#pageContent").fadeIn(200);
                    });
                });

                // Update browser history (like React Router)
                window.history.pushState({ path: page }, "", page);
            });

            // Handle browser back/forward buttons
            window.onpopstate = function(event) {
                if (event.state) {
                    $("#pageContent").load(event.state.path + " #content");
                }
            };
        });
    </script>
</body>
</html>