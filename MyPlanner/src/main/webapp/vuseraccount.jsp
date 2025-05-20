<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MyPlanner - Vendor Details</title>
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
            background: #6366f1;
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
        .btn-primary {
            background: #6366f1;
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            background: #4f46e5;
            transform: translateY(-2px);
        }
        .btn-danger {
            background: #ef4444;
            transition: all 0.3s ease;
        }
        .btn-danger:hover {
            background: #dc2626;
            transform: translateY(-2px);
        }
        .vendor-card {
            position: relative;
            overflow: hidden;
        }
        .vendor-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 6px;
            height: 100%;
            background: linear-gradient(to bottom, #6366f1, #8b5cf6);
            border-top-left-radius: 0.5rem;
            border-bottom-left-radius: 0.5rem;
        }
        .toast {
            position: fixed;
            top: 1rem;
            right: 1rem;
            z-index: 9999;
            transition: transform 0.3s ease-out, opacity 0.3s ease-out;
            transform: translateX(100%);
            opacity: 0;
        }
        .toast.show {
            transform: translateX(0);
            opacity: 1;
        }
        .detail-row {
            transition: all 0.2s ease;
        }
        .detail-row:hover {
            background-color: #f3f4f6;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        .animate-fade-in {
            animation: fadeIn 0.5s ease-in-out forwards;
        }
    </style>
</head>
<body>
<% String successMessage = (String) request.getAttribute("successMessage"); %>
<% String unsuccessMessage = (String) request.getAttribute("unsuccessMessage"); %>

<!-- Modern Toast Notifications instead of alerts -->
<% if (successMessage != null) { %>
    <div id="successToast" class="toast bg-green-100 border-l-4 border-green-500 text-green-700 p-4 rounded shadow-lg max-w-md">
        <div class="flex">
            <div class="flex-shrink-0">
                <i class="fas fa-check-circle"></i>
            </div>
            <div class="ml-3">
                <p class="font-medium">Success!</p>
                <p class="text-sm"><%= successMessage %></p>
            </div>
            <div class="ml-auto">
                <button onclick="closeToast('successToast')" class="text-green-500 hover:text-green-700">
                    <i class="fas fa-times"></i>
                </button>
            </div>
        </div>
    </div>
    <script>
        setTimeout(function() {
            document.getElementById('successToast').classList.add('show');
            setTimeout(function() { 
                document.getElementById('successToast').classList.remove('show');
            }, 5000);
        }, 300);
    </script>
<% } %>

<% if (unsuccessMessage != null) { %>
    <div id="errorToast" class="toast bg-red-100 border-l-4 border-red-500 text-red-700 p-4 rounded shadow-lg max-w-md">
        <div class="flex">
            <div class="flex-shrink-0">
                <i class="fas fa-exclamation-circle"></i>
            </div>
            <div class="ml-3">
                <p class="font-medium">Error!</p>
                <p class="text-sm"><%= unsuccessMessage %></p>
            </div>
            <div class="ml-auto">
                <button onclick="closeToast('errorToast')" class="text-red-500 hover:text-red-700">
                    <i class="fas fa-times"></i>
                </button>
            </div>
        </div>
    </div>
    <script>
        setTimeout(function() {
            document.getElementById('errorToast').classList.add('show');
            setTimeout(function() { 
                document.getElementById('errorToast').classList.remove('show');
            }, 5000);
        }, 300);
    </script>
<% } %>

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
                <a href="/" class="nav-link text-gray-800 font-medium">Home</a>
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
                <a href="/gallery" class="nav-link text-gray-800 font-medium">Gallery</a>
                <a href="/contact" class="nav-link text-gray-800 font-medium">Contact Us</a>
                <a href="/about" class="nav-link text-gray-800 font-medium">About Us</a>
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
                    <a href="/account" class="text-indigo-600 hover:text-indigo-800 font-medium text-sm">My Account</a>
                    <div class="h-8 w-8 bg-indigo-100 rounded-full flex items-center justify-center">
                        <i class="fas fa-user text-indigo-600"></i>
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
    <div class="max-w-4xl mx-auto">
        <!-- Page Title with Breadcrumbs -->
        <div class="mb-8">
            <nav class="flex mb-4" aria-label="Breadcrumb">
                <ol class="inline-flex items-center space-x-1 md:space-x-3 text-sm">
                    <li class="inline-flex items-center">
                        <a href="/" class="text-gray-600 hover:text-indigo-600">
                            <i class="fas fa-home mr-2"></i>Home
                        </a>
                    </li>
                    <li>
                        <div class="flex items-center">
                            <i class="fas fa-chevron-right text-gray-400 mx-2 text-xs"></i>
                            <a href="/vendors" class="text-gray-600 hover:text-indigo-600">Vendors</a>
                        </div>
                    </li>
                    <li aria-current="page">
                        <div class="flex items-center">
                            <i class="fas fa-chevron-right text-gray-400 mx-2 text-xs"></i>
                            <span class="text-indigo-600 font-medium">Vendor Details</span>
                        </div>
                    </li>
                </ol>
            </nav>
            <h1 class="text-3xl font-bold text-gray-800">Vendor Details</h1>
            <p class="text-gray-600 mt-2">View and manage vendor information</p>
        </div>
        
        <!-- Vendor Details Card -->
        <c:forEach var="v" items="${vendorDetails}">
            <div class="bg-white rounded-lg shadow-md overflow-hidden vendor-card animate-fade-in">
                <!-- Vendor Header with Name -->
                <div class="bg-gradient-to-r from-indigo-600 to-purple-600 py-6 px-8">
                    <div class="flex justify-between items-center">
                        <div>
                            <h2 class="text-2xl font-bold text-white">${v.name}</h2>
                            <p class="text-indigo-100 mt-1">Vendor ID: ${v.id}</p>
                        </div>
                        <div class="flex space-x-2">
                            <c:url value="updatevendor.jsp" var="vendorupdate">
                                <c:param name="id" value="${v.id}"/>
                                <c:param name="name" value="${v.name}"/>
                                <c:param name="email" value="${v.email}"/>
                                <c:param name="phone" value="${v.phone}"/>
                                <c:param name="address" value="${v.address}"/>
                                <c:param name="services" value="${v.services}"/>
                                <c:param name="username" value="${v.username}"/>
                                <c:param name="password" value="${v.password}"/>
                            </c:url>
                            <a href="${vendorupdate}" class="px-4 py-2 bg-white text-indigo-600 rounded-md font-medium hover:bg-gray-100 transition flex items-center">
                                <i class="fas fa-edit mr-2"></i> Edit
                            </a>
                            
                            <c:url value="deletevendor.jsp" var="vendordelete">
                                <c:param name="id" value="${v.id}"/>
                                <c:param name="name" value="${v.name}"/>
                                <c:param name="email" value="${v.email}"/>
                                <c:param name="phone" value="${v.phone}"/>
                                <c:param name="address" value="${v.address}"/>
                                <c:param name="services" value="${v.services}"/>
                                <c:param name="username" value="${v.username}"/>
                                <c:param name="password" value="${v.password}"/>
                            </c:url>
                            <a href="${vendordelete}" class="px-4 py-2 bg-red-500 text-white rounded-md font-medium hover:bg-red-600 transition flex items-center">
                                <i class="fas fa-trash-alt mr-2"></i> Delete
                            </a>
                        </div>
                    </div>
                </div>
                
                <!-- Vendor Information -->
                <div class="p-8">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <!-- Contact Information Section -->
                        <div class="space-y-6">
                            <h3 class="text-lg font-semibold text-gray-800 pb-2 border-b border-gray-200">Contact Information</h3>
                            
                            <!-- Email -->
                            <div class="detail-row p-3 rounded-lg">
                                <div class="flex items-start">
                                    <div class="flex-shrink-0 mt-1">
                                        <div class="h-8 w-8 bg-indigo-100 rounded-full flex items-center justify-center">
                                            <i class="fas fa-envelope text-indigo-600"></i>
                                        </div>
                                    </div>
                                    <div class="ml-4">
                                        <h4 class="text-sm font-medium text-gray-500">Email</h4>
                                        <p class="text-lg font-medium text-gray-900">${v.email}</p>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Phone -->
                            <div class="detail-row p-3 rounded-lg">
                                <div class="flex items-start">
                                    <div class="flex-shrink-0 mt-1">
                                        <div class="h-8 w-8 bg-indigo-100 rounded-full flex items-center justify-center">
                                            <i class="fas fa-phone-alt text-indigo-600"></i>
                                        </div>
                                    </div>
                                    <div class="ml-4">
                                        <h4 class="text-sm font-medium text-gray-500">Phone</h4>
                                        <p class="text-lg font-medium text-gray-900">${v.phone}</p>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Address -->
                            <div class="detail-row p-3 rounded-lg">
                                <div class="flex items-start">
                                    <div class="flex-shrink-0 mt-1">
                                        <div class="h-8 w-8 bg-indigo-100 rounded-full flex items-center justify-center">
                                            <i class="fas fa-map-marker-alt text-indigo-600"></i>
                                        </div>
                                    </div>
                                    <div class="ml-4">
                                        <h4 class="text-sm font-medium text-gray-500">Address</h4>
                                        <p class="text-lg font-medium text-gray-900">${v.address}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Business Information Section -->
                        <div class="space-y-6">
                            <h3 class="text-lg font-semibold text-gray-800 pb-2 border-b border-gray-200">Business Information</h3>
                            
                            <!-- Services -->
                            <div class="detail-row p-3 rounded-lg">
                                <div class="flex items-start">
                                    <div class="flex-shrink-0 mt-1">
                                        <div class="h-8 w-8 bg-indigo-100 rounded-full flex items-center justify-center">
                                            <i class="fas fa-concierge-bell text-indigo-600"></i>
                                        </div>
                                    </div>
                                    <div class="ml-4">
                                        <h4 class="text-sm font-medium text-gray-500">Services Offered</h4>
                                        <p class="text-lg font-medium text-gray-900">${v.services}</p>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Username -->
                            <div class="detail-row p-3 rounded-lg">
                                <div class="flex items-start">
                                    <div class="flex-shrink-0 mt-1">
                                        <div class="h-8 w-8 bg-indigo-100 rounded-full flex items-center justify-center">
                                            <i class="fas fa-user-circle text-indigo-600"></i>
                                        </div>
                                    </div>
                                    <div class="ml-4">
                                        <h4 class="text-sm font-medium text-gray-500">Username</h4>
                                        <p class="text-lg font-medium text-gray-900">${v.username}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Action Buttons -->
                    <div class="mt-8 pt-5 border-t border-gray-200">
                        <div class="flex flex-col sm:flex-row justify-between items-center">
                            <a href="/vendors" class="text-gray-600 hover:text-gray-800 font-medium flex items-center mb-4 sm:mb-0">
                                <i class="fas fa-arrow-left mr-2"></i> Back to Vendors List
                            </a>
                            <div class="flex space-x-3">
                                <a href="mailto:${v.email}" class="px-4 py-2 border border-gray-300 rounded-md text-gray-700 hover:bg-gray-50 transition flex items-center">
                                    <i class="fas fa-envelope mr-2"></i> Contact Vendor
                                </a>
                                <a href="#" class="px-4 py-2 bg-indigo-600 text-white rounded-md hover:bg-indigo-700 transition flex items-center">
                                    <i class="fas fa-calendar-alt mr-2"></i> View Bookings
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
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
                    <a href="#" class="text-gray-400 hover:text-white transition">
                        <i class="fab fa-facebook-f text-xl"></i>
                    </a>
                    <a href="#" class="text-gray-400 hover:text-white transition">
                        <i class="fab fa-instagram text-xl"></i>
                    </a>
                    <a href="#" class="text-gray-400 hover:text-white transition">
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

<!-- JavaScript -->
<script>
    // Close toast notification
    function closeToast(id) {
        document.getElementById(id).classList.remove('show');
    }
</script>
</body>
</html>