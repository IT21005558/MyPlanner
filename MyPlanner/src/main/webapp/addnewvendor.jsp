<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MyPlanner - Vendor Registration</title>
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
        .btn-primary:disabled {
            background: #9ca3af;
            cursor: not-allowed;
            transform: none;
        }
        .social-icon {
            transition: transform 0.3s ease;
        }
        .social-icon:hover {
            transform: translateY(-3px);
        }
        .form-section {
            position: relative;
            overflow: hidden;
        }
        .form-section::before {
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
        .password-toggle {
            cursor: pointer;
        }
        .service-card {
            transition: all 0.3s ease;
            border: 2px solid transparent;
        }
        .service-card:hover {
            border-color: #e0e7ff;
            transform: translateY(-2px);
        }
        .service-checkbox:checked + .service-card {
            border-color: #4f46e5;
            background-color: #e0e7ff;
        }
        @keyframes pulse {
            0%, 100% {
                opacity: 1;
            }
            50% {
                opacity: 0.6;
            }
        }
        .terms-pulse {
            animation: pulse 2s infinite;
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
                    <a href="/login" class="text-indigo-600 hover:text-indigo-800 font-medium text-sm">Login / Sign Up</a>
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
    <div class="max-w-3xl mx-auto">
        <!-- Page Title -->
        <div class="text-center mb-8">
            <h1 class="text-3xl font-bold text-gray-800">Join Our Vendor Network</h1>
            <p class="text-gray-600 mt-2">Register your business to offer services through MyPlanner</p>
        </div>
        
        <!-- Registration Form Card -->
        <div class="bg-white rounded-lg shadow-md overflow-hidden form-section">
            <div class="p-8">
                <form action="registervendor" method="post" class="space-y-6">
                    <!-- Business Information Section -->
                    <div class="space-y-6">
                        <h3 class="text-lg font-semibold text-gray-800 pb-2 border-b border-gray-200">Business Information</h3>
                        
                        <!-- Business Name Field -->
                        <div class="space-y-2">
                            <label for="name" class="block text-sm font-medium text-gray-700">Business Name</label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                    <i class="fas fa-building text-gray-400"></i>
                                </div>
                                <input type="text" id="name" name="name" required
                                       class="pl-10 block w-full rounded-md border-gray-300 shadow-sm focus:outline-none py-3 px-4 border"
                                       placeholder="Enter your business name">
                            </div>
                        </div>
                    </div>
                    
                    <!-- Contact Information Section -->
                    <div class="space-y-6 pt-4">
                        <h3 class="text-lg font-semibold text-gray-800 pb-2 border-b border-gray-200">Contact Information</h3>
                        
                        <!-- Email Field -->
                        <div class="space-y-2">
                            <label for="email" class="block text-sm font-medium text-gray-700">Business Email</label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                    <i class="fas fa-envelope text-gray-400"></i>
                                </div>
                                <input type="email" id="email" name="email" required
                                       class="pl-10 block w-full rounded-md border-gray-300 shadow-sm focus:outline-none py-3 px-4 border"
                                       placeholder="your.business@example.com">
                            </div>
                            <p class="text-xs text-gray-500">We'll use this email for business communications</p>
                        </div>
                        
                        <!-- Phone Field -->
                        <div class="space-y-2">
                            <label for="phone" class="block text-sm font-medium text-gray-700">Business Phone</label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                    <i class="fas fa-phone-alt text-gray-400"></i>
                                </div>
                                <input type="tel" id="phone" name="phone" required
                                       class="pl-10 block w-full rounded-md border-gray-300 shadow-sm focus:outline-none py-3 px-4 border"
                                       placeholder="+94 1X XXX XXXX">
                            </div>
                        </div>
                        
                        <!-- Address Field -->
                        <div class="space-y-2">
                            <label for="address" class="block text-sm font-medium text-gray-700">Business Address</label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                    <i class="fas fa-map-marker-alt text-gray-400"></i>
                                </div>
                                <input type="text" id="address" name="address" required
                                       class="pl-10 block w-full rounded-md border-gray-300 shadow-sm focus:outline-none py-3 px-4 border"
                                       placeholder="Enter your business address">
                            </div>
                        </div>
                    </div>
                    
                    <!-- Services Offered Section -->
                    <div class="space-y-6 pt-4">
                        <h3 class="text-lg font-semibold text-gray-800 pb-2 border-b border-gray-200">Services Offered</h3>
                        <p class="text-sm text-gray-600 mb-4">Select the services your business provides (choose all that apply)</p>
                        
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <!-- Catering Service -->
                            <div class="relative">
                                <input type="checkbox" id="catering" name="services[]" value="Catering" class="service-checkbox absolute opacity-0 w-0 h-0">
                                <label for="catering" class="service-card flex items-center p-4 rounded-lg bg-gray-50 cursor-pointer">
                                    <span class="flex-shrink-0 h-10 w-10 rounded-full bg-indigo-100 flex items-center justify-center mr-4">
                                        <i class="fas fa-utensils text-indigo-600"></i>
                                    </span>
                                    <div>
                                        <span class="block font-medium">Catering</span>
                                        <span class="text-xs text-gray-500">Food & beverage services</span>
                                    </div>
                                </label>
                            </div>
                            
                            <!-- Decoration Service -->
                            <div class="relative">
                                <input type="checkbox" id="decoration" name="services[]" value="Decoration" class="service-checkbox absolute opacity-0 w-0 h-0">
                                <label for="decoration" class="service-card flex items-center p-4 rounded-lg bg-gray-50 cursor-pointer">
                                    <span class="flex-shrink-0 h-10 w-10 rounded-full bg-indigo-100 flex items-center justify-center mr-4">
                                        <i class="fas fa-paint-brush text-indigo-600"></i>
                                    </span>
                                    <div>
                                        <span class="block font-medium">Decoration</span>
                                        <span class="text-xs text-gray-500">Event styling & decor</span>
                                    </div>
                                </label>
                            </div>
                            
                            <!-- Venue Service -->
                            <div class="relative">
                                <input type="checkbox" id="venue" name="services[]" value="Venue Services" class="service-checkbox absolute opacity-0 w-0 h-0">
                                <label for="venue" class="service-card flex items-center p-4 rounded-lg bg-gray-50 cursor-pointer">
                                    <span class="flex-shrink-0 h-10 w-10 rounded-full bg-indigo-100 flex items-center justify-center mr-4">
                                        <i class="fas fa-landmark text-indigo-600"></i>
                                    </span>
                                    <div>
                                        <span class="block font-medium">Venue Services</span>
                                        <span class="text-xs text-gray-500">Location & space rental</span>
                                    </div>
                                </label>
                            </div>
                            
                            <!-- Photography Service -->
                            <div class="relative">
                                <input type="checkbox" id="photography" name="services[]" value="Photography" class="service-checkbox absolute opacity-0 w-0 h-0">
                                <label for="photography" class="service-card flex items-center p-4 rounded-lg bg-gray-50 cursor-pointer">
                                    <span class="flex-shrink-0 h-10 w-10 rounded-full bg-indigo-100 flex items-center justify-center mr-4">
                                        <i class="fas fa-camera text-indigo-600"></i>
                                    </span>
                                    <div>
                                        <span class="block font-medium">Photography</span>
                                        <span class="text-xs text-gray-500">Photo & video services</span>
                                    </div>
                                </label>
                            </div>
                            
                            <!-- Entertainment Service -->
                            <div class="relative md:col-span-2">
                                <input type="checkbox" id="entertainment" name="services[]" value="Entertainment" class="service-checkbox absolute opacity-0 w-0 h-0">
                                <label for="entertainment" class="service-card flex items-center p-4 rounded-lg bg-gray-50 cursor-pointer">
                                    <span class="flex-shrink-0 h-10 w-10 rounded-full bg-indigo-100 flex items-center justify-center mr-4">
                                        <i class="fas fa-music text-indigo-600"></i>
                                    </span>
                                    <div>
                                        <span class="block font-medium">Entertainment</span>
                                        <span class="text-xs text-gray-500">Music, performances & activities</span>
                                    </div>
                                </label>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Account Information Section -->
                    <div class="space-y-6 pt-4">
                        <h3 class="text-lg font-semibold text-gray-800 pb-2 border-b border-gray-200">Account Information</h3>
                        
                        <!-- Username Field -->
                        <div class="space-y-2">
                            <label for="username" class="block text-sm font-medium text-gray-700">Username</label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                    <i class="fas fa-user-circle text-gray-400"></i>
                                </div>
                                <input type="text" id="username" name="username" required
                                       class="pl-10 block w-full rounded-md border-gray-300 shadow-sm focus:outline-none py-3 px-4 border"
                                       placeholder="Choose a unique username">
                            </div>
                            <p class="text-xs text-gray-500">You'll use this to log in to your vendor dashboard</p>
                        </div>
                        
                        <!-- Password Field -->
                        <div class="space-y-2">
                            <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                    <i class="fas fa-lock text-gray-400"></i>
                                </div>
                                <input type="password" id="password" name="password" required
                                       class="pl-10 block w-full rounded-md border-gray-300 shadow-sm focus:outline-none py-3 px-4 border"
                                       placeholder="Choose a strong password">
                                <div class="absolute inset-y-0 right-0 pr-3 flex items-center">
                                    <i class="fas fa-eye password-toggle text-gray-400" onclick="togglePasswordVisibility()"></i>
                                </div>
                            </div>
                            <div class="text-xs text-gray-500 space-y-1 mt-2">
                                <p>Password must:</p>
                                <ul class="list-disc pl-5 space-y-1">
                                    <li>Be at least 8 characters long</li>
                                    <li>Include at least one uppercase letter</li>
                                    <li>Include at least one number</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Terms and Conditions Checkbox -->
                    <div class="pt-4">
                        <div class="flex items-start">
                            <div class="flex items-center h-5">
                                <input type="checkbox" class="h-4 w-4 text-indigo-600 border-gray-300 rounded focus:ring-indigo-500" 
                                       id="terms_conditions" name="terms_conditions" required onchange="toggleSubmit()">
                            </div>
                            <div class="ml-3 text-sm">
                                <label for="terms_conditions" class="font-medium text-gray-700">
                                    I agree to the <a href="terms.jsp" target="_blank" class="text-indigo-600 hover:text-indigo-800">Terms and Conditions</a>
                                </label>
                                <p class="text-gray-500">By registering, you agree to our vendor terms of service and privacy policy.</p>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Submit Button -->
                    <div class="pt-5">
                        <button type="submit" id="register" disabled
                                class="btn-primary w-full py-3 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 flex items-center justify-center">
                            <i class="fas fa-store mr-2"></i> Register as Vendor
                        </button>
                    </div>
                    
                    <!-- Login Link -->
                    <div class="text-center mt-6">
                        <p class="text-sm text-gray-600">
                            Already registered? <a href="login.jsp" class="text-indigo-600 hover:text-indigo-800 font-medium">Sign in</a>
                        </p>
                    </div>
                </form>
            </div>
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
<script>
    // Toggle password visibility
    function togglePasswordVisibility() {
        const passwordInput = document.getElementById('password');
        const passwordToggle = document.querySelector('.password-toggle');
        
        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            passwordToggle.classList.remove('fa-eye');
            passwordToggle.classList.add('fa-eye-slash');
        } else {
            passwordInput.type = 'password';
            passwordToggle.classList.remove('fa-eye-slash');
            passwordToggle.classList.add('fa-eye');
        }
    }
    
    // Toggle submit button based on terms checkbox
    function toggleSubmit() {
        const registerButton = document.getElementById('register');
        const termsCheckbox = document.getElementById('terms_conditions');
        
        if (termsCheckbox.checked) {
            registerButton.disabled = false;
            registerButton.classList.remove('terms-pulse');
        } else {
            registerButton.disabled = true;
            registerButton.classList.add('terms-pulse');
        }
    }
    
    document.addEventListener('DOMContentLoaded', function() {
        // Set password validation
        const passwordInput = document.getElementById('password');
        passwordInput.addEventListener('input', function() {
            const password = this.value;
            const hasUppercase = /[A-Z]/.test(password);
            const hasNumber = /[0-9]/.test(password);
            const isLongEnough = password.length >= 8;
            
            // Add visual feedback for password requirements
            const passwordRequirements = document.querySelectorAll('.text-gray-500 ul li');
            
            if (passwordRequirements.length >= 3) {
                passwordRequirements[0].classList.toggle('text-green-600', isLongEnough);
                passwordRequirements[1].classList.toggle('text-green-600', hasUppercase);
                passwordRequirements[2].classList.toggle('text-green-600', hasNumber);
            }
        });
    });
</script>
</body>
</html>