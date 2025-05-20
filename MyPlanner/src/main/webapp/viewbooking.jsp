<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MyPlanner - View Bookings</title>
    <!-- Modern CSS framework -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- DataTables CSS -->
    <link href="https://cdn.datatables.net/1.11.5/css/dataTables.tailwindcss.min.css" rel="stylesheet">
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
        .dataTables_filter input {
            border: 1px solid #d1d5db;
            border-radius: 0.375rem;
            padding: 0.5rem 1rem;
            margin-left: 0.5rem;
            outline: none;
        }
        .dataTables_filter input:focus {
            border-color: #4f46e5;
            box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.2);
        }
        .dataTables_length select {
            border: 1px solid #d1d5db;
            border-radius: 0.375rem;
            padding: 0.5rem;
            margin: 0 0.5rem;
            outline: none;
        }
        .dataTables_length select:focus {
            border-color: #4f46e5;
            box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.2);
        }
        .dataTables_paginate .paginate_button {
            padding: 0.5rem 1rem;
            border-radius: 0.375rem;
            margin: 0 0.25rem;
            cursor: pointer;
        }
        .dataTables_paginate .paginate_button.current {
            background-color: #4f46e5;
            color: white !important;
        }
        .dataTables_paginate .paginate_button:hover:not(.current) {
            background-color: #f3f4f6;
        }
        .btn-primary {
            background: #4f46e5;
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            background: #4338ca;
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
        .social-icon {
            transition: transform 0.3s ease;
        }
        .social-icon:hover {
            transform: translateY(-3px);
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
                    <a href="useraccount.jsp" class="text-indigo-600 hover:text-indigo-800 font-medium text-sm">User Account</a>
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
    <div class="bg-white rounded-lg shadow-md overflow-hidden p-6">
        <!-- Page Header -->
        <div class="flex justify-between items-center mb-6">
            <div>
                <h2 class="text-2xl font-bold text-gray-800">Manage Bookings</h2>
                <p class="text-gray-600">View, search, edit, and manage all your event bookings</p>
            </div>
            
            <!-- Add Booking Card -->
            <div class="bg-gradient-to-r from-indigo-600 to-purple-600 rounded-lg shadow-md overflow-hidden flex items-center">
                <div class="p-4 text-white">
                    <h3 class="font-semibold">Need to schedule a new event?</h3>
                    <p class="text-indigo-100 text-sm">Create a new booking quickly</p>
                </div>
                <a href="booking.jsp" class="bg-white text-indigo-600 hover:text-indigo-800 font-medium px-4 py-2 m-4 rounded-md transition transform hover:-translate-y-1 hover:shadow-md flex items-center">
                    <i class="fas fa-plus mr-2"></i> Add New Booking
                </a>
            </div>
        </div>
        
        <!-- View Options -->
        <div class="flex items-center space-x-4 mb-6">
            <a href="viewbooking" class="text-indigo-600 hover:text-indigo-800 font-medium text-sm flex items-center">
                <i class="fas fa-sync-alt mr-2"></i> Refresh All Bookings
            </a>
            <div class="border-r border-gray-300 h-6"></div>
            <div class="text-gray-600 text-sm flex items-center">
                <i class="fas fa-filter mr-2"></i> Filter by:
            </div>
            <select id="statusFilter" class="border border-gray-300 rounded-md px-2 py-1 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500">
                <option value="all">All Status</option>
                <option value="upcoming">Upcoming</option>
                <option value="past">Past Events</option>
            </select>
        </div>
        
        <!-- Bookings Table -->
        <div class="overflow-hidden rounded-lg border border-gray-200">
            <table id="bookingsTable" class="min-w-full divide-y divide-gray-200">
                <thead class="bg-gray-50">
                    <tr>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Booking ID</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Client ID</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Hotel</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Event Hall</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Event Date</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Event Time</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                    <!-- Loop through your booking data and generate rows for each booking -->
                    <c:forEach items="${BookingDetails}" var="booking">
                        <tr class="hover:bg-gray-50 transition">
                            <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">${booking.booking_id}</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${booking.client_id}</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${booking.hotel}</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${booking.hall}</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${booking.edate}</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${booking.etime}</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm font-medium space-y-2">
                                <div class="flex space-x-2">
                                    <a href="<c:url value='updatebooking.jsp'>
                                        <c:param name='booking_id' value='${booking.booking_id}'/>
                                        <c:param name='client_id' value='${booking.client_id}'/>
                                        <c:param name='hotel' value='${booking.hotel}'/>
                                        <c:param name='hall' value='${booking.hall}'/>
                                        <c:param name='edate' value='${booking.edate}'/>
                                        <c:param name='etime' value='${booking.etime}'/>
                                    </c:url>" class="text-white bg-indigo-600 hover:bg-indigo-700 px-3 py-1 rounded-md text-sm font-medium transition flex items-center">
                                        <i class="fas fa-edit mr-1"></i> Edit
                                    </a>
                                    <form action="deletebooking.jsp" method="post" class="inline-block">
                                        <input type="hidden" name="booking_id" value="${booking.booking_id}">
                                        <button type="submit" class="text-white bg-red-600 hover:bg-red-700 px-3 py-1 rounded-md text-sm font-medium transition flex items-center">
                                            <i class="fas fa-trash-alt mr-1"></i> Delete
                                        </button>
                                    </form>
                                </div>
                                <a href="#" class="text-indigo-600 hover:text-indigo-800 text-sm flex items-center">
                                    <i class="fas fa-eye mr-1"></i> View Details
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/dataTables.tailwindcss.min.js"></script>
<script>
    // Initialize DataTables for advanced searching and pagination
    $(document).ready(function() {
        let table = $('#bookingsTable').DataTable({
            responsive: true,
            language: {
                search: "Search bookings:",
                lengthMenu: "Show _MENU_ bookings per page",
                info: "Showing _START_ to _END_ of _TOTAL_ bookings",
                paginate: {
                    first: '<i class="fas fa-angle-double-left"></i>',
                    previous: '<i class="fas fa-angle-left"></i>',
                    next: '<i class="fas fa-angle-right"></i>',
                    last: '<i class="fas fa-angle-double-right"></i>'
                }
            },
            dom: '<"flex flex-col md:flex-row justify-between items-start md:items-center mb-4"<"flex-1"l><"flex-1 mt-2 md:mt-0"f>>rtip'
        });
        
        // Custom filter for event dates (upcoming/past)
        $('#statusFilter').on('change', function() {
            let filterValue = $(this).val();
            
            if (filterValue === 'all') {
                table.columns(4).search('').draw();
            } else if (filterValue === 'upcoming') {
                // Custom filter for upcoming events
                $.fn.dataTable.ext.search.push(
                    function(settings, data, dataIndex) {
                        let eventDate = new Date(data[4]); // Column 4 is Event Date
                        let today = new Date();
                        
                        return eventDate >= today;
                    }
                );
                table.draw();
                $.fn.dataTable.ext.search.pop(); // Remove the filter after drawing
            } else if (filterValue === 'past') {
                // Custom filter for past events
                $.fn.dataTable.ext.search.push(
                    function(settings, data, dataIndex) {
                        let eventDate = new Date(data[4]); // Column 4 is Event Date
                        let today = new Date();
                        
                        return eventDate < today;
                    }
                );
                table.draw();
                $.fn.dataTable.ext.search.pop(); // Remove the filter after drawing
            }
        });
    });
    
    // Close toast notification
    function closeToast(id) {
        document.getElementById(id).classList.remove('show');
    }
</script>
</body>
</html>