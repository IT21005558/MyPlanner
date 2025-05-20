<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Contact Us - MyPlanner</title>

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

        /* Contact page container styles */
        .contact-container {
            max-width: 700px;
            margin: 40px auto;
            background-color: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        .contact-header {
            background-color: #4f46e5;
            padding: 20px;
            text-align: center;
            color: white;
            margin-bottom: 0;
            font-weight: 700;
            font-size: 2rem;
            border-radius: 0 0 12px 12px;
        }
        label {
            display: block;
            margin-top: 1rem;
            font-weight: 600;
            color: #444;
        }
        input[type="text"],
        input[type="email"],
        textarea {
            width: 100%;
            margin-top: 0.3rem;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 1rem;
            resize: vertical;
            font-family: inherit;
        }
        textarea {
            min-height: 120px;
        }
        button {
            margin-top: 20px;
            background-color: #4f46e5;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-size: 1rem;
        }
        button:hover {
            background-color: #4338ca;
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
                <a href="contact.jsp" class="nav-link active text-gray-800 font-medium">Contact Us</a>
                <a href="about.jsp" class="nav-link text-gray-800 font-medium">About Us</a>
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

<!-- Contact Us Content -->
<section class="max-w-3xl mx-auto my-16 px-6">
    <h1 class="text-4xl font-extrabold text-[#4f46e5] mb-10 text-center font-sans">Contact Us</h1>
    <form action="#" method="POST" class="bg-white p-8 rounded-xl shadow-lg space-y-6 font-sans">
        <div>
            <label for="name" class="block text-gray-700 font-semibold mb-2">Full Name</label>
            <input type="text" id="name" name="name" required
                class="w-full border border-gray-300 rounded-md px-4 py-3 bg-gray-50 placeholder-gray-400 text-gray-800
                       focus:outline-none focus:ring-2 focus:ring-[#4f46e5] transition" placeholder="Your full name" />
        </div>

        <div>
            <label for="email" class="block text-gray-700 font-semibold mb-2">Email Address</label>
            <input type="email" id="email" name="email" required
                class="w-full border border-gray-300 rounded-md px-4 py-3 bg-gray-50 placeholder-gray-400 text-gray-800
                       focus:outline-none focus:ring-2 focus:ring-[#4f46e5] transition" placeholder="you@example.com" />
        </div>

        <div>
            <label for="subject" class="block text-gray-700 font-semibold mb-2">Subject</label>
            <input type="text" id="subject" name="subject" required
                class="w-full border border-gray-300 rounded-md px-4 py-3 bg-gray-50 placeholder-gray-400 text-gray-800
                       focus:outline-none focus:ring-2 focus:ring-[#4f46e5] transition" placeholder="Subject" />
        </div>

        <div>
            <label for="message" class="block text-gray-700 font-semibold mb-2">Message</label>
            <textarea id="message" name="message" required
                class="w-full border border-gray-300 rounded-md px-4 py-3 bg-gray-50 placeholder-gray-400 text-gray-800
                       focus:outline-none focus:ring-2 focus:ring-[#4f46e5] transition resize-none"
                rows="6" style="height: 150px;" placeholder="Write your message here..."></textarea>
        </div>

        <button type="submit"
            class="w-full bg-[#4f46e5] text-white font-bold py-3 rounded-md hover:bg-[#4338ca] transition">
            Send Message
        </button>
    </form>
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