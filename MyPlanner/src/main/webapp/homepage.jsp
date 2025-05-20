<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MyPlanner - Home Dashboard</title>
    <!-- Modern CSS framework -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
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
        .dashboard-card {
            transition: all 0.3s ease;
            overflow: hidden;
            border-radius: 0.75rem;
        }
        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
        }
        .dashboard-card img {
            transition: all 0.5s ease;
        }
        .dashboard-card:hover img {
            transform: scale(1.05);
        }
        .card-overlay {
            background: linear-gradient(to top, rgba(0, 0, 0, 0.7) 0%, rgba(0, 0, 0, 0) 100%);
        }
        .btn-primary {
            background: #4f46e5;
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            background: #4338ca;
            transform: translateY(-2px);
        }
        .social-icon {
            transition: transform 0.3s ease;
        }
        .social-icon:hover {
            transform: translateY(-3px);
        }
        .feature-card {
            transition: all 0.3s ease;
        }
        .feature-card:hover {
            transform: translateY(-5px);
        }
        .animate-float {
            animation: float 6s ease-in-out infinite;
        }
        @keyframes float {
            0% {
                transform: translateY(0px);
            }
            50% {
                transform: translateY(-10px);
            }
            100% {
                transform: translateY(0px);
            }
        }
    </style>
</head>
<body>
<!-- Header -->
<header class="bg-white shadow-sm sticky top-0 z-50">
    <div class="container mx-auto px-4">
        <div class="flex justify-between items-center py-4">
            <!-- Logo -->
            <div class="flex items-center space-x-2">
                <a href="homepage.jsp" class="flex items-center">
                    <img src="mainLogo.png" alt="MyPlanner Logo" class="h-12 w-12">
                    <div class="ml-2">
                        <h1 class="text-2xl font-bold text-gray-800">MyPlanner</h1>
                        <p class="text-sm text-gray-600">Plan the event of your life</p>
                    </div>
                </a>
            </div>
            
            <!-- Navigation -->
            <nav class="hidden md:flex items-center space-x-8">
                <a href="/" class="nav-link active text-gray-800 font-medium">Home</a>
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
                <a href="about.jsp" class="nav-link text-gray-800 font-medium">About Us</a>
            </nav>
            
            <!-- Search & User -->
            <div class="flex items-center space-x-6">
                <!-- Search -->
                <div class="hidden md:flex items-center relative bg-gray-100 rounded-full px-3 py-1">
                    <input type="text" placeholder="Search..." class="bg-transparent border-none focus:outline-none text-sm w-40">
                    <button class="ml-2 text-gray-500">
                        <i class="fas fa-search"></i>
                    </button>
                </div>
                
                <!-- User -->
                <div class="flex items-center space-x-2">
                    <a href="clientlogin.jsp" class="text-indigo-600 hover:text-indigo-800 font-medium text-sm">Login / Sign Up</a>
                    <div class="h-8 w-8 bg-gray-200 rounded-full flex items-center justify-center">
                        <i class="fas fa-user text-gray-500"></i>
                    </div>
                </div>
                
                <!-- Mobile Menu Button -->
                <button class="md:hidden text-gray-700">
                    <i class="fas fa-bars text-xl"></i>
                </button>
            </div>
        </div>
    </div>
</header>

<!-- Welcome Banner -->
<section class="bg-gradient-to-r from-indigo-600 to-purple-600 py-12 text-white">
    <div class="container mx-auto px-4">
        <div class="flex flex-col md:flex-row items-center justify-between">
            <div class="md:w-1/2 mb-8 md:mb-0">
                <h1 class="text-4xl font-bold mb-4">Welcome to MyPlanner Dashboard</h1>
                <p class="text-xl text-indigo-100 mb-6">Your one-stop solution for event planning and management</p>
                <div class="flex space-x-4">
                    <a href="#dashboard-cards" class="px-6 py-3 bg-white text-indigo-600 font-medium rounded-lg hover:bg-gray-100 transition">
                        Get Started
                    </a>
                    <a href="#" class="px-6 py-3 border border-white text-white font-medium rounded-lg hover:bg-white hover:text-indigo-600 transition">
                        Contact Us
                    </a>
                </div>
            </div>
            <div class="md:w-1/2 flex justify-center">
                <img src="event1.jpg" alt="Event Planning" class="rounded-lg shadow-lg animate-float max-w-full h-auto">
            </div>
        </div>
    </div>
</section>

<!-- Main Dashboard Cards -->
<section id="dashboard-cards" class="py-16">
    <div class="container mx-auto px-4">
        <div class="text-center mb-12">
            <h2 class="text-3xl font-bold text-gray-800">Manage Your Events</h2>
            <p class="text-gray-600 mt-2">Select an option to get started with your event planning journey</p>
        </div>
        
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            <!-- Booking Card -->
            <div class="dashboard-card shadow-lg bg-white overflow-hidden h-96">
                <div class="relative h-64">
                    <img src="booking.jpg" alt="Booking Management" class="w-full h-full object-cover">
                    <div class="absolute inset-0 card-overlay flex items-end">
                        <div class="p-6">
                            <span class="bg-indigo-600 text-white px-3 py-1 rounded-full text-sm font-medium">Events</span>
                            <h3 class="text-white text-2xl font-bold mt-2">Booking Management</h3>
                        </div>
                    </div>
                </div>
                <div class="p-6">
                    <p class="text-gray-600 mb-4">View, edit, and manage all your event bookings in one place</p>
                    <a href="viewbooking.jsp" class="btn-primary inline-flex items-center px-4 py-2 rounded-lg text-white">
                        Go to Booking <i class="fas fa-arrow-right ml-2"></i>
                    </a>
                </div>
            </div>
            
            <!-- Create Event Card -->
            <div class="dashboard-card shadow-lg bg-white overflow-hidden h-96">
                <div class="relative h-64">
                    <img src="create_event.jpg" alt="Create New Event" class="w-full h-full object-cover">
                    <div class="absolute inset-0 card-overlay flex items-end">
                        <div class="p-6">
                            <span class="bg-green-600 text-white px-3 py-1 rounded-full text-sm font-medium">Plan</span>
                            <h3 class="text-white text-2xl font-bold mt-2">Create New Event</h3>
                        </div>
                    </div>
                </div>
                <div class="p-6">
                    <p class="text-gray-600 mb-4">Start planning a new event with our intuitive event creation tools</p>
                    <a href="#" class="btn-primary inline-flex items-center px-4 py-2 rounded-lg text-white">
                        Create Event <i class="fas fa-plus ml-2"></i>
                    </a>
                </div>
            </div>
            
            <!-- Vendor Services Card -->
            <div class="dashboard-card shadow-lg bg-white overflow-hidden h-96">
                <div class="relative h-64">
                    <img src="vendor.jpg" alt="Vendor Services" class="w-full h-full object-cover">
                    <div class="absolute inset-0 card-overlay flex items-end">
                        <div class="p-6">
                            <span class="bg-purple-600 text-white px-3 py-1 rounded-full text-sm font-medium">Services</span>
                            <h3 class="text-white text-2xl font-bold mt-2">Vendor Services</h3>
                        </div>
                    </div>
                </div>
                <div class="p-6">
                    <p class="text-gray-600 mb-4">Explore and book services from our network of trusted vendors</p>
                    <a href="#" class="btn-primary inline-flex items-center px-4 py-2 rounded-lg text-white">
                        View Services <i class="fas fa-store ml-2"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Features Section -->
<section class="py-16 bg-gray-50">
    <div class="container mx-auto px-4">
        <div class="text-center mb-12">
            <h2 class="text-3xl font-bold text-gray-800">Why Choose MyPlanner?</h2>
            <p class="text-gray-600 mt-2">Our platform offers everything you need for successful event planning</p>
        </div>
        
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
            <!-- Feature 1 -->
            <div class="feature-card bg-white p-6 rounded-lg shadow-md">
                <div class="h-12 w-12 bg-indigo-100 rounded-lg flex items-center justify-center mb-4">
                    <i class="fas fa-calendar-alt text-indigo-600 text-xl"></i>
                </div>
                <h3 class="text-lg font-semibold text-gray-800 mb-2">Easy Scheduling</h3>
                <p class="text-gray-600">Intuitive calendar interface for managing event dates and times</p>
            </div>
            
            <!-- Feature 2 -->
            <div class="feature-card bg-white p-6 rounded-lg shadow-md">
                <div class="h-12 w-12 bg-indigo-100 rounded-lg flex items-center justify-center mb-4">
                    <i class="fas fa-users text-indigo-600 text-xl"></i>
                </div>
                <h3 class="text-lg font-semibold text-gray-800 mb-2">Vendor Network</h3>
                <p class="text-gray-600">Access to our curated network of trusted event service providers</p>
            </div>
            
            <!-- Feature 3 -->
            <div class="feature-card bg-white p-6 rounded-lg shadow-md">
                <div class="h-12 w-12 bg-indigo-100 rounded-lg flex items-center justify-center mb-4">
                    <i class="fas fa-tasks text-indigo-600 text-xl"></i>
                </div>
                <h3 class="text-lg font-semibold text-gray-800 mb-2">Task Management</h3>
                <p class="text-gray-600">Keep track of all your event planning tasks in one place</p>
            </div>
            
            <!-- Feature 4 -->
            <div class="feature-card bg-white p-6 rounded-lg shadow-md">
                <div class="h-12 w-12 bg-indigo-100 rounded-lg flex items-center justify-center mb-4">
                    <i class="fas fa-mobile-alt text-indigo-600 text-xl"></i>
                </div>
                <h3 class="text-lg font-semibold text-gray-800 mb-2">Mobile Friendly</h3>
                <p class="text-gray-600">Access your event details anytime, anywhere on any device</p>
            </div>
        </div>
    </div>
</section>

<!-- Call to Action -->
<section class="py-12 bg-gradient-to-r from-indigo-600 to-purple-600 text-white">
    <div class="container mx-auto px-4 text-center">
        <h2 class="text-3xl font-bold mb-4">Ready to plan your next event?</h2>
        <p class="text-xl text-indigo-100 mb-8 max-w-2xl mx-auto">Let MyPlanner help you create unforgettable experiences with our comprehensive event planning tools</p>
        <a href="booking.jsp" class="px-8 py-4 bg-white text-indigo-600 font-bold rounded-lg hover:bg-gray-100 transition text-lg">
            Book Your Event Now
        </a>
    </div>
</section>

<!-- Footer -->
<footer class="bg-gray-900 text-white pt-16 pb-6">
    <div class="container mx-auto px-4">
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-5 gap-8">
            <!-- Brand Column -->
            <div class="lg:col-span-2">
                <div class="flex items-center mb-4">
                    <img src="mainLogo1.png" alt="MyPlanner Logo" class="h-16 w-16">
                    <h3 class="text-xl font-bold ml-2">MyPlanner</h3>
                </div>
                <p class="text-gray-400 mb-6">We offer customized event planning services tailored to your specific needs.</p>
                <div class="flex space-x-4">
                    <a href="#" class="social-icon text-gray-400 hover:text-white">
                        <i class="fab fa-facebook-f text-xl"></i>
                    </a>
                    <a href="#" class="social-icon text-gray-400 hover:text-white">
                        <i class="fab fa-instagram text-xl"></i>
                    </a>
                    <a href="#" class="social-icon text-gray-400 hover:text-white">
                        <i class="fab fa-twitter text-xl"></i>
                    </a>
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
                    <li><a href="#" class="text-gray-400 hover:text-white transition">About Us</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition">Contact Us</a></li>
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