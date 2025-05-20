<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>About Us - MyPlanner</title>

    <!-- Tailwind CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet" />
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet" />

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            color: #333;
        }
        .nav-link {
            position: relative;
        }
        .nav-link:after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            background: #4f46e5;
            bottom: -4px;
            left: 0;
            transition: width 0.3s ease;
        }
        .nav-link:hover:after, .active:after {
            width: 100%;
        }
        .dropdown-menu {
            display: none;
            position: absolute;
            background: white;
            min-width: 180px;
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
            border-radius: 0.5rem;
            padding: 0.5rem 0;
            z-index: 100;
        }
        .dropdown:hover .dropdown-menu {
            display: block;
        }
        .social-icon {
            transition: transform 0.3s ease;
        }
        .social-icon:hover {
            transform: translateY(-3px);
        }
        .about-section {
            max-width: 1000px;
            margin: 40px auto;
            background-color: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        .about-header {
            background-color: #4f46e5;
            padding: 20px;
            text-align: center;
            color: white;
            margin-bottom: 20px;
            font-weight: 700;
            font-size: 2rem;
            border-radius: 12px;
        }
        .team-card {
            transition: transform 0.3s ease;
        }
        .team-card:hover {
            transform: translateY(-5px);
        }
    </style>
</head>
<body>

<!-- Header -->
<header class="bg-white shadow-sm sticky top-0 z-50">
    <div class="container mx-auto px-4">
        <div class="flex justify-between items-center py-4">
            <div class="flex items-center space-x-2">
                <a href="homepage.jsp" class="flex items-center">
                    <img src="mainLogo.png" alt="MyPlanner Logo" class="h-12 w-12" />
                    <div class="ml-2">
                        <h1 class="text-2xl font-bold text-gray-800">MyPlanner</h1>
                        <p class="text-sm text-gray-600">Plan the event of your life</p>
                    </div>
                </a>
            </div>

            <!-- Navigation -->
            <nav class="hidden md:flex items-center space-x-8">
                <a href="homepage.jsp" class="nav-link text-gray-800 font-medium">Home</a>
                <div class="dropdown relative">
                    <a href="#" class="nav-link text-gray-800 font-medium flex items-center">
                        Services <i class="fas fa-chevron-down ml-1 text-xs"></i>
                    </a>
                    <div class="dropdown-menu">
                        <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Awards</a>
                        <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Candidates</a>
                        <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">About Award Ceremony</a>
                        <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Nomination Result</a>
                        <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Sponsors</a>
                    </div>
                </div>
                <a href="#" class="nav-link text-gray-800 font-medium">Gallery</a>
                <a href="contact.jsp" class="nav-link text-gray-800 font-medium">Contact Us</a>
                <a href="about.jsp" class="nav-link active text-gray-800 font-medium">About Us</a>
            </nav>

            <!-- User Area -->
            <div class="flex items-center space-x-6">
                <a href="clientlogin.jsp" class="text-indigo-600 hover:text-indigo-800 font-medium text-sm">Login / Sign Up</a>
                <div class="h-8 w-8 bg-gray-200 rounded-full flex items-center justify-center">
                    <i class="fas fa-user text-gray-500"></i>
                </div>
                <button class="md:hidden text-gray-700">
                    <i class="fas fa-bars text-xl"></i>
                </button>
            </div>
        </div>
    </div>
</header>

<!-- About Us Content -->
<section class="about-section">
    <h1 class="about-header">About MyPlanner</h1>
    <div class="px-6">
        <p class="text-gray-600 mb-6">MyPlanner is your one-stop solution for event planning and management. We specialize in creating unforgettable experiences by offering customized event planning services tailored to your specific needs. Whether it's a wedding, corporate event, or award ceremony, our intuitive tools and trusted vendor network make planning seamless and stress-free.</p>
        <p class="text-gray-600 mb-6">Founded in 2020, our mission is to simplify event planning with modern technology and a customer-centric approach. We connect you with top-tier vendors, provide easy scheduling tools, and ensure every detail is perfect, so you can focus on enjoying your event.</p>
        
        <h2 class="text-2xl font-bold text-gray-800 mb-4">Our Mission</h2>
        <p class="text-gray-600 mb-6">To empower individuals and businesses to create memorable events with ease, using innovative tools and a curated network of service providers.</p>
        
        <h2 class="text-2xl font-bold text-gray-800 mb-4">Our Team</h2>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            <div class="team-card bg-gray-50 p-4 rounded-lg shadow-md text-center">
                <img src="user2.jpg" alt="Team Member" class="h-24 w-24 rounded-full mx-auto mb-4 object-cover" />
                <h3 class="text-lg font-semibold text-gray-800">Jane Doe</h3>
                <p class="text-gray-600">Event Planning Director</p>
            </div>
            <div class="team-card bg-gray-50 p-4 rounded-lg shadow-md text-center">
                <img src="user1.jpg" alt="Team Member" class="h-24 w-24 rounded-full mx-auto mb-4 object-cover" />
                <h3 class="text-lg font-semibold text-gray-800">John Smith</h3>
                <p class="text-gray-600">Vendor Coordinator</p>
            </div>
            <div class="team-card bg-gray-50 p-4 rounded-lg shadow-md text-center">
                <img src="user3.jpg" alt="Team Member" class="h-24 w-24 rounded-full mx-auto mb-4 object-cover" />
                <h3 class="text-lg font-semibold text-gray-800">Emily Brown</h3>
                <p class="text-gray-600">Customer Success Manager</p>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="bg-gray-900 text-white pt-16 pb-6">
    <div class="container mx-auto px-4">
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-5 gap-8">
            <!-- Brand Column -->
            <div class="lg:col-span-2">
                <div class="flex items-center mb-4">
                    <img src="mainLogo1.png" alt="MyPlanner Logo" class="h-16 w-16" />
                    <h3 class="text-xl font-bold ml-2">MyPlanner</h3>
                </div>
                <p class="text-gray-400 mb-6">We offer customized event planning services tailored to your specific needs.</p>
                <div class="flex space-x-4">
                    <a href="#" class="social-icon text-gray-400 hover:text-white"><i class="fab fa-facebook-f text-xl"></i></a>
                    <a href="#" class="social-icon text-gray-400 hover:text-white"><i class="fab fa-instagram text-xl"></i></a>
                    <a href="#" class="social-icon text-gray-400 hover:text-white"><i class="fab fa-twitter text-xl"></i></a>
                </div>
            </div>

            <!-- For Customers -->
            <div>
                <h4 class="text-lg font-semibold mb-4">For Customers</h4>
                <ul class="space-y-3">
                    <li><a href="#" class="text-gray-400 hover:text-white transition">Events</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition">Consulting</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition">Plan Events</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition">Booking Venues</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition">Reserve Services</a></li>
                </ul>
            </div>

            <!-- For Vendors -->
            <div>
                <h4 class="text-lg font-semibold mb-4">For Vendors</h4>
                <ul class="space-y-3">
                    <li><a href="#" class="text-gray-400 hover:text-white transition">Advertisement</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition">Service Info</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition">Recommendation</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition">Why Should Join</a></li>
                </ul>
            </div>

            <!-- We Are -->
            <div>
                <h4 class="text-lg font-semibold mb-4">We Are</h4>
                <ul class="space-y-3">
                    <li><a href="about.jsp" class="text-gray-400 hover:text-white transition">About Us</a></li>
                    <li><a href="contact.jsp" class="text-gray-400 hover:text-white transition">Contact Us</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition">What is Event Planning?</a></li>
                </ul>
            </div>
        </div>

        <!-- Copyright -->
        <div class="border-t border-gray-800 mt-12 pt-8 text-center">
            <p>© 2025 MyPlanner. All rights reserved.</p>
        </div>
    </div>
</footer>

</body>
</html>