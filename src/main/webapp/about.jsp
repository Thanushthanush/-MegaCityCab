<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="java.util.List" %>
<%@ page import="com.megacitycab.model.TeamMember" %>

<% 
    List<TeamMember> teamMembers = (List<TeamMember>) request.getAttribute("teamMembers"); 
    request.setAttribute("teamMembers", teamMembers);
%>

<body>

    <!-- Include Navbar -->
    <jsp:include page="navbar.jsp" />
    
<div id="content">
    <!-- Hero Section -->
    <header class="bg-primary text-white text-center py-5">
        <div class="container">
            <h1 class="fw-bold">About Mega City Cab</h1>
            <p class="lead">Your Trusted Ride Partner in Colombo</p>
            <a href="home.jsp" class="btn btn-light btn-lg text-primary fw-bold">
                <i class="bi bi-arrow-left-circle"></i> Back to Home
            </a>
        </div>
    </header>

    <!-- Company Overview -->
    <section class="container mt-5">
        <div class="row text-center">
            <div class="col-md-4">
                <i class="bi bi-car-front-fill text-primary" style="font-size: 3rem;"></i>
                <h4 class="mt-3">Who We Are</h4>
                <p>Providing safe, reliable, and affordable cab services across Colombo.</p>
            </div>
            <div class="col-md-4">
                <i class="bi bi-clock-history text-success" style="font-size: 3rem;"></i>
                <h4 class="mt-3">Years of Experience</h4>
                <p>Over 10 years in the industry, serving thousands of happy customers.</p>
            </div>
            <div class="col-md-4">
                <i class="bi bi-award text-danger" style="font-size: 3rem;"></i>
                <h4 class="mt-3">Quality & Safety</h4>
                <p>Top-rated drivers, secure rides, and best-in-class customer service.</p>
            </div>
        </div>
    </section>

    <!-- Mission & Vision -->
    <section class="bg-light py-5 mt-5">
        <div class="container text-center">
            <h2 class="fw-bold">Our Mission & Vision</h2>
            <div class="row mt-4">
                <div class="col-md-6">
                    <i class="bi bi-bullseye text-primary" style="font-size: 3rem;"></i>
                    <h5>Our Mission</h5>
                    <p>To provide safe, reliable, and convenient transportation to our customers.</p>
                </div>
                <div class="col-md-6">
                    <i class="bi bi-eye text-success" style="font-size: 3rem;"></i>
                    <h5>Our Vision</h5>
                    <p>To be the leading cab service provider in Sri Lanka with a focus on innovation and quality.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Our Team Section -->
    <section class="container mt-5">
        <h2 class="text-center fw-bold">Meet Our Team</h2>
        <div class="row text-center mt-4">
            <c:forEach var="member" items="${teamMembers}">
                <div class="col-md-4">
                    <img src="${member.imageUrl}" class="rounded-circle mb-3" width="150" height="150" alt="${member.name}">
                    <h5>${member.name}</h5>
                    <p class="text-muted">${member.post}</p>
                </div>
            </c:forEach>
        </div>
    </section>

    <!-- Call to Action -->
    <section class="bg-primary text-white text-center py-5 mt-5">
        <div class="container">
            <h2 class="fw-bold">Join Our Journey</h2>
            <p>Book a cab with us today and experience a smooth ride.</p>
            <a href="bookCab.jsp" class="btn btn-light text-primary btn-lg fw-bold">
                <i class="bi bi-geo-alt"></i> Book Now
            </a>
        </div>
    </section>
    
    <!-- Footer -->
    <footer class="bg-dark text-white text-center py-3">
        <p>&copy; 2025 Mega City Cab. All Rights Reserved.</p>
    </footer>
</div>
</body>