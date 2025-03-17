<%@page import="com.megacitycab.model.Places"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book a Ride</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

    <!-- Custom CSS -->
    <style>
        /* Custom CSS for a neon-themed UI */
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #0a0a0a; /* Dark background for neon effect */
            color: #ffffff; /* White text for contrast */
        }

        header {
            background: linear-gradient(135deg, #ff00cc, #3333ff); /* Neon pink to blue gradient */
            color: white;
            padding: 60px 0;
            text-align: center;
        }

        header h1 {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 10px;
            text-shadow: 0 0 10px #ff00cc, 0 0 20px #ff00cc, 0 0 30px #ff00cc; /* Neon glow effect */
        }

        header p {
            font-size: 1.2rem;
            font-weight: 400;
            text-shadow: 0 0 10px #3333ff, 0 0 20px #3333ff, 0 0 30px #3333ff; /* Neon glow effect */
        }

        .card {
            border: none;
            border-radius: 12px;
            background-color: #1a1a1a; /* Dark card background */
            box-shadow: 0 0 20px rgba(255, 0, 204, 0.3), 0 0 40px rgba(51, 51, 255, 0.3); /* Neon glow effect */
            padding: 20px;
        }

        .form-label {
            font-weight: 500;
            color: #ffffff; /* White text for labels */
        }

        .form-control, .form-select {
            border: 2px solid #3333ff; /* Neon blue border */
            border-radius: 8px;
            padding: 10px;
            font-size: 14px;
            background-color: #1a1a1a; /* Dark input background */
            color: #ffffff; /* White text */
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .form-control:focus, .form-select:focus {
            border-color: #ff00cc; /* Neon pink border on focus */
            box-shadow: 0 0 10px rgba(255, 0, 204, 0.5), 0 0 20px rgba(51, 51, 255, 0.5); /* Neon glow effect */
            outline: none;
        }

        .btn-primary {
            background-color: #3333ff; /* Neon blue */
            border: none;
            padding: 12px;
            font-size: 16px;
            font-weight: 600;
            border-radius: 8px;
            color: #ffffff; /* White text */
            transition: background-color 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #ff00cc; /* Neon pink on hover */
            transform: translateY(-2px);
            box-shadow: 0 0 10px rgba(255, 0, 204, 0.5), 0 0 20px rgba(51, 51, 255, 0.5); /* Neon glow effect */
        }

        .btn-secondary {
            background-color: #ff00cc; /* Neon pink */
            border: none;
            padding: 12px;
            font-size: 16px;
            font-weight: 600;
            border-radius: 8px;
            color: #ffffff; /* White text */
            transition: background-color 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
        }

        .btn-secondary:hover {
            background-color: #3333ff; /* Neon blue on hover */
            transform: translateY(-2px);
            box-shadow: 0 0 10px rgba(255, 0, 204, 0.5), 0 0 20px rgba(51, 51, 255, 0.5); /* Neon glow effect */
        }

        footer {
            background-color: #1a1a1a; /* Dark footer background */
            color: #ffffff; /* White text */
            padding: 20px 0;
            text-align: center;
            font-size: 0.9rem;
            box-shadow: 0 0 20px rgba(255, 0, 204, 0.3), 0 0 40px rgba(51, 51, 255, 0.3); /* Neon glow effect */
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
        <header>
            <div class="container">
                <h1>Book Your Ride</h1>
                <p>Fast, Reliable & Safe Cab Service in Colombo</p>
            </div>
        </header>

        <section class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <h2 class="text-center fw-bold">Book a Cab</h2>

                        <form action="BookCabServlet" method="POST">
                            <!-- Pickup Location Dropdown -->
                            <div class="mb-3">
                                <label for="pickupLocation" class="form-label">Pickup Location</label>
                                <select class="form-control" name="pickupLocation" id="pickupLocation" required>
                                    <option value="">Select Pickup Location</option>
                                    <c:forEach var="place" items="${placeList}">
                                        <option value="${places.placeName}">${places.placeName}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <!-- Dropoff Location Dropdown -->
                            <div class="mb-3">
                                <label for="dropoffLocation" class="form-label">Drop-off Location</label>
                                <select class="form-control" name="dropoffLocation" id="dropoffLocation" required>
                                    <option value="">Select Dropoff Location</option>
                                    <c:forEach var="place" items="${placeList}">
                                        <option value="${places.placeName}">${places.placeName}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label for="rideDate" class="form-label">Date</label>
                                <input type="date" class="form-control" id="rideDate" name="rideDate" required>
                            </div>

                            <div class="mb-3">
                                <label for="rideTime" class="form-label">Time</label>
                                <input type="time" class="form-control" id="rideTime" name="rideTime" required>
                            </div>

                            <div class="mb-3">
                                <label for="cabType" class="form-label">Cab Type</label>
                                <select class="form-select" id="cabType" name="cabType" required>
                                    <option value="Standard">Standard</option>
                                    <option value="Executive">Executive</option>
                                    <option value="Luxury">Luxury</option>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label for="distance" class="form-label">Distance</label>
                                <input type="text" class="form-control" id="distance" name="distance" required>
                            </div>

                            <div class="mb-3">
                                <label for="price" class="form-label">Estimated Fare</label>
                                <input type="text" class="form-control" id="price" name="price" readonly>
                            </div>

                            <div class="d-grid">
                                <button type="button" class="btn btn-secondary fw-bold" onclick="calculateDistance()">
                                    <i class="bi bi-cash"></i> Calculate Fare
                                </button>
                                <button type="submit" class="btn btn-primary fw-bold mt-2">
                                    <i class="bi bi-check-circle"></i> Confirm Booking
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer>
            <p>&copy; 2025 Mega City Cab. All Rights Reserved.</p>
        </footer>
    </div>

</body>
</html>