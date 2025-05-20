<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MyPlanner - Event Booking</title>
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
        input:focus, select:focus {
            border-color: #4f46e5;
            box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.2);
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
    </style>
</head>
<body>
<% 
    String id = request.getParameter("id");
%>

<!-- Header -->
<header class="bg-white shadow-sm sticky top-0 z-50">
    <div class="container mx-auto px-4">
        <div class="flex justify-between items-center py-4">
            <!-- Logo -->
            <div class="flex items-center space-x-2">
                <a href="/" class="flex items-center">
                    <img src="mainLogo.png" alt="MyPlanner Logo" class="h-12 w-12">
                    <div class="ml-2">
                        <h1 class="text-2xl font-bold text-gray-800">MyPlanner</h1>
                        <p class="text-sm text-gray-600">Plan the event of your life</p>
                    </div>
                </a>
            </div>
            
            <!-- Navigation -->
            <nav class="hidden md:flex items-center space-x-8">
                <a href="homepage.jsp" class="nav-link active text-gray-800 font-medium">Home</a>
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
                <a href="#" class="nav-link text-gray-800 font-medium">Contact Us</a>
                <a href="#" class="nav-link text-gray-800 font-medium">About Us</a>
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

<!-- Main Content -->
<main class="container mx-auto px-4 py-10">
    <div class="max-w-2xl mx-auto bg-white rounded-lg shadow-md overflow-hidden">
        <!-- Form Header -->
        <div class="bg-gradient-to-r from-indigo-600 to-purple-600 py-6 px-8">
            <h2 class="text-2xl font-bold text-white">Book Your Event</h2>
            <p class="text-indigo-100 mt-1">Fill in the details below to reserve your venue</p>
        </div>
        
        <!-- Booking Form -->
        <div class="p-8">
            <form action="bookingevent" method="post" class="space-y-6">
                <!-- Hidden Client ID Field -->
                <input type="hidden" id="client_id" name="client_id" value="1">
                
                <!-- Hotel Field -->
                <div class="space-y-2">
                    <label for="hotel" class="block text-sm font-medium text-gray-700">Hotel / Venue Name</label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <i class="fas fa-hotel text-gray-400"></i>
                        </div>
                        <input type="text" id="hotel" name="hotel" required 
                               class="pl-10 block w-full rounded-md border-gray-300 shadow-sm focus:outline-none py-3 px-4 border"
                               placeholder="Enter hotel or venue name">
                    </div>
                </div>
                
                <!-- Event Hall Field -->
                <div class="space-y-2">
                    <label for="hall" class="block text-sm font-medium text-gray-700">Event Hall / Room</label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <i class="fas fa-door-open text-gray-400"></i>
                        </div>
                        <input type="text" id="hall" name="hall" required 
                               class="pl-10 block w-full rounded-md border-gray-300 shadow-sm focus:outline-none py-3 px-4 border"
                               placeholder="Specify the hall or room name">
                    </div>
                </div>
                
                <!-- Date and Time Fields in a Grid -->
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <!-- Event Date Field -->
                    <div class="space-y-2">
                        <label for="edate" class="block text-sm font-medium text-gray-700">Event Date</label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <i class="fas fa-calendar text-gray-400"></i>
                            </div>
                            <input type="date" id="edate" name="edate" required 
                                   class="pl-10 block w-full rounded-md border-gray-300 shadow-sm focus:outline-none py-3 px-4 border"
                                   pattern="\d{4}-\d{2}-\d{2}">
                        </div>
                    </div>
                    
                    <!-- Event Time Field -->
                    <div class="space-y-2">
                        <label for="etime" class="block text-sm font-medium text-gray-700">Event Time</label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <i class="fas fa-clock text-gray-400"></i>
                            </div>
                            <input type="time" id="etime" name="etime" required 
                                   class="pl-10 block w-full rounded-md border-gray-300 shadow-sm focus:outline-none py-3 px-4 border">
                        </div>
                    </div>
                </div>
                
                <!-- Submit Button -->
                <div class="pt-4">
                    <button type="submit" 
                            class="btn-primary w-full py-3 px-4 bg-indigo-600 hover:bg-indigo-700 text-white font-medium rounded-md shadow-md focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2">
                        Book Now <i class="fas fa-arrow-right ml-2"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>
</main>

<!-- Footer -->
<footer class="bg-gray-900 text-white mt-16">
    <div class="container mx-auto px-4 py-12">
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
                
                <div class="mt-8">
                    <h4 class="text-lg font-semibold mb-4">Connect with Us</h4>
                    <button class="bg-indigo-600 hover:bg-indigo-700 py-2 px-4 rounded-md transition transform hover:-translate-y-1">
                        BOOK CONSULTATION
                    </button>
                </div>
            </div>
        </div>
        
        <!-- Copyright -->
        <div class="border-t border-gray-800 mt-12 pt-8 text-center">
            <p>© 2025 MyPlanner. All rights reserved.</p>
        </div>
    </div>
</footer>

<!-- JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/alpinejs/3.10.2/cdn.min.js"></script>
<script>
    // Add any custom JavaScript here
    document.addEventListener('DOMContentLoaded', function() {
        // Set minimum date to today
        const today = new Date().toISOString().split('T')[0];
        document.getElementById('edate').setAttribute('min', today);
        
        // Form validation enhancement could be added here
    });
</script>
</body>
</html>