<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="com.megacitycab.model.User"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Mega City Cab</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

    <!-- Custom CSS -->
    <style>
        /* Custom CSS for a dark blue-themed UI */
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #0a192f; /* Dark blue background */
            color: #ffffff; /* White text for contrast */
        }

        header {
            background: linear-gradient(135deg, #1a365d, #0a192f); /* Dark blue gradient */
            color: white;
            padding: 60px 0;
            text-align: center;
        }

        header h1 {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 10px;
        }

        header p {
            font-size: 1.2rem;
            font-weight: 400;
        }

        .btn-light {
            background-color: #ffffff;
            color: #1a365d;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            font-weight: 600;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .btn-light:hover {
            background-color: #e2e8f0;
            transform: translateY(-2px);
        }

        .card {
            border: none;
            border-radius: 12px;
            background-color: #1a365d; /* Dark blue card background */
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
            padding: 20px;
        }

        .form-label {
            font-weight: 500;
            color: #ffffff; /* White text for labels */
        }

        .form-control, .form-select {
            border: 2px solid #2c5282; /* Medium blue border */
            border-radius: 8px;
            padding: 10px;
            font-size: 14px;
            background-color: #1a365d; /* Dark blue input background */
            color: #ffffff; /* White text */
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .form-control:focus, .form-select:focus {
            border-color: #4299e1; /* Light blue border on focus */
            box-shadow: 0 0 10px rgba(66, 153, 225, 0.5);
            outline: none;
        }

        .btn-primary {
            background-color: #4299e1; /* Light blue */
            border: none;
            padding: 12px;
            font-size: 16px;
            font-weight: 600;
            border-radius: 8px;
            color: #ffffff; /* White text */
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #3182ce; /* Medium blue on hover */
            transform: translateY(-2px);
        }

        footer {
            background-color: #1a365d; /* Dark blue footer background */
            color: #ffffff; /* White text */
            padding: 20px 0;
            text-align: center;
            font-size: 0.9rem;
        }

        footer p {
            margin: 0;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            header h1 {
                font-size: 2rem;
            }

            header p {
                font-size: 1rem;
            }

            .card {
                padding: 15px;
            }
        }
    </style>
</head>
<body>

    <!-- Include Navbar -->
    <jsp:include page="navbar.jsp" />

    <div id="content">
        <!-- Hero Section -->
        <header>
            <div class="container">
                <h1>Contact Mega City Cab</h1>
                <p>We’re here to assist you 24/7.</p>
                <a href="index.jsp" class="btn btn-light btn-lg">
                    <i class="bi bi-arrow-left-circle"></i> Back to Home
                </a>
            </div>
        </header>

        <!-- Contact Details -->
        <section class="container mt-5">
            <div class="row text-center">
                <div class="col-md-4">
                    <i class="bi bi-geo-alt text-danger" style="font-size: 3rem;"></i>
                    <h4 class="mt-3">Our Address</h4>
                    <p>123 Main Street, Colombo, Sri Lanka</p>
                </div>
                <div class="col-md-4">
                    <i class="bi bi-telephone text-primary" style="font-size: 3rem;"></i>
                    <h4 class="mt-3">Call Us</h4>
                    <p>+94 77 123 4567</p>
                </div>
                <div class="col-md-4">
                    <i class="bi bi-envelope text-success" style="font-size: 3rem;"></i>
                    <h4 class="mt-3">Email Us</h4>
                    <p>support@megacitycab.com</p>
                </div>
            </div>
        </section>

        <% String loggedInUser = (String) session.getAttribute("username"); %>
        <% if (loggedInUser != null) { %>
        
        <!-- Contact Form -->
        <section class="bg-light py-5 mt-5">
            <div class="container text-center">
                <h2 class="fw-bold">Send Us a Message</h2>
                <div class="row justify-content-center mt-4">
                    <div class="col-md-6">
                        <form action="CommentServlet" method="post">
                            <div class="mb-3">
                                <label for="name" class="form-label">User Name</label>
                                <input type="name" class="form-control" id="name" name="name" value="<%= loggedInUser %>" required readonly>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Your Email</label>
                                <input type="email" class="form-control" id="email" name="email" required></textarea>
                            </div>

                            <div class="mb-3">
                                <label for="message" class="form-label">Your Message</label>
                                <textarea class="form-control" id="message" name="message" rows="4" required></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary btn-lg">
                                <i class="bi bi-send"></i> Send Message
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <% } else { %>
        
        <!-- Message for Unauthenticated Users -->
        <section class="text-center py-5">
            <h4 class="fw-bold">You need to sign in to send a message.</h4>
            <a href="#signInModal" class="btn btn-primary">Sign In</a>
        </section>
        <% } %>

        <!-- Google Map -->
        <section class="container text-center my-5">
            <h4 class="fw-bold">Find Us on the Map</h4>
            <iframe 
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3960.742525907021!2d79.86124357508728!3d6.919162593081983!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae2591c1b4f9b13%3A0xabcde1234567890!2sColombo%2C%20Sri%20Lanka!5e0!3m2!1sen!2s!4v1700000000000" 
                width="100%" height="350" style="border:0;" allowfullscreen="" loading="lazy">
            </iframe>
        </section>

        <!-- Call to Action -->
        <section class="bg-primary text-white text-center py-5 mt-5">
            <div class="container">
                <h2 class="fw-bold">Need Help?</h2>
                <p>Contact our support team for assistance.</p>
                <a href="index.jsp" class="btn btn-light text-primary btn-lg fw-bold">
                    <i class="bi bi-house-door"></i> Back to Home
                </a>
            </div>
        </section>
        
        <!-- Footer -->
        <footer>
            <p>&copy; 2025 Mega City Cab. All Rights Reserved.</p>
        </footer>
    </div>

</body>
</html>