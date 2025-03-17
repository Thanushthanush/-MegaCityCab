<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mega City Cab</title>

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
            color: #ffffff; /* White text */
        }

        .card img {
            border: 2px solid #4299e1; /* Light blue border for images */
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

    <div id="content">
        <!-- Hero Section -->
        <header>
            <div class="container">
                <h1>Welcome to Mega City Cab</h1>
                <p>Book a cab in seconds, ride in comfort.</p>
                <a href="bookCab.jsp" class="btn btn-light btn-lg">
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
        <!-- Testimonials Section -->
        <section class="container mt-5">
            <h2 class="text-center fw-bold">What Our Customers Say</h2>
            <div class="row text-center mt-4">
                <c:if test="${not empty testimonial1}">
                    <div class="col-md-4">
                        <div class="card shadow-sm p-3">
                            <img src="${testimonial1['imageUrl']}" alt="${testimonial1['fullname']}" class="rounded-circle mx-auto d-block" style="width: 80px; height: 80px;">
                            <blockquote class="blockquote mt-3">
                                <p>?${testimonial1['comment']}?</p>
                                <footer class="blockquote-footer">${testimonial1['fullname']}</footer>
                            </blockquote>
                        </div>
                    </div>
                </c:if>
                <c:if test="${not empty testimonial2}">
                    <div class="col-md-4">
                        <div class="card shadow-sm p-3">
                            <img src="${testimonial2['imageUrl']}" alt="${testimonial2['fullname']}" class="rounded-circle mx-auto d-block" style="width: 80px; height: 80px;">
                            <blockquote class="blockquote mt-3">
                                <p>?${testimonial2['comment']}?</p>
                                <footer class="blockquote-footer">${testimonial2['fullname']}</footer>
                            </blockquote>
                        </div>
                    </div>
                </c:if>
                <c:if test="${not empty testimonial3}">
                    <div class="col-md-4">
                        <div class="card shadow-sm p-3">
                            <img src="${testimonial3['imageUrl']}" alt="${testimonial3['fullname']}" class="rounded-circle mx-auto d-block" style="width: 80px; height: 80px;">
                            <blockquote class="blockquote mt-3">
                                <p>?${testimonial3['comment']}?</p>
                                <footer class="blockquote-footer">${testimonial3['fullname']}</footer>
                            </blockquote>
                        </div>
                    </div>
                </c:if>
                <c:if test="${empty testimonial1 && empty testimonial2 && empty testimonial3}">
                    <p class="text-center text-danger">No testimonials available.</p>
                </c:if>
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
        <footer>
            <p>&copy; 2025 Mega City Cab. All Rights Reserved.</p>
        </footer>
    </div>

</body>
</html>