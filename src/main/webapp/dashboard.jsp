<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GroceMe Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Poppins', sans-serif;
            background: url('./resources/banana.jpg') center/cover no-repeat fixed;
            color: #333;
        }
        .top-navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: rgba(0, 0, 0, 0.7);
            padding: 15px 50px;
            backdrop-filter: blur(6px);
            border-bottom: 2px solid rgba(255, 255, 255, 0.2);
        }
        .stylish-address-form {
            display: flex;
            align-items: center;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 25px;
            padding: 5px 15px;
        }
        .stylish-address-form input {
            background: transparent;
            border: none;
            outline: none;
            color: #fff;
            padding: 8px;
            font-size: 14px;
            width: 220px;
        }
        .stylish-address-form button {
            background-color: #8DC63F;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 20px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: 600;
        }
        .stylish-address-form button:hover {
            background-color: #fff;
            color: #8DC63F;
            transform: scale(1.05);
        }
        .address-text {
            color: #fff;
            margin-right: 10px;
            font-weight: 500;
        }
        .edit-btn {
            background-color: #8DC63F;
            border: none;
            border-radius: 50%;
            width: 28px;
            height: 28px;
            font-size: 16px;
            cursor: pointer;
            color: #fff;
            transition: all 0.3s;
        }
        .edit-btn:hover {
            background-color: #fff;
            color: #8DC63F;
            transform: rotate(90deg);
        }
        .profile-logo {
            width: 45px;
            height: 45px;
            border-radius: 50%;
            border: 2px solid #fff;
            object-fit: cover;
            cursor: pointer;
            transition: transform 0.3s;
        }
        .profile-logo:hover {
            transform: scale(1.1);
        }
        .hero {
            text-align: center;
            padding: 60px 20px;
            background: rgba(255, 255, 255, 0.15);
            color: #fff;
            border-bottom: 2px solid rgba(255,255,255,0.2);
            backdrop-filter: blur(6px);
        }
        .hero h1 {
            font-size: 3rem;
            color: #fff;
            font-weight: 700;
        }
        .hero span {
            color: #8DC63F;
        }
        .hero p {
            font-size: 1.1rem;
            color: #f3f3f3;
            margin-top: 10px;
        }
        .categories {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(230px, 1fr));
            gap: 30px;
            padding: 60px;
        }
        .category-card {
            background: rgba(255, 255, 255, 0.85);
            border-radius: 20px;
            padding: 25px;
            text-align: center;
            color: #333;
            transition: all 0.4s ease;
            box-shadow: 0 6px 20px rgba(0,0,0,0.2);
        }
        .category-card img {
            width: 140px;
            height: 140px;
            object-fit: cover;
            border-radius: 15px;
            margin-bottom: 15px;
            transition: transform 0.3s ease;
        }
        .category-card:hover img {
            transform: scale(1.1);
        }
        .category-card:hover {
            transform: scale(1.04);
            background: rgba(255, 255, 255, 0.95);
            box-shadow: 0 10px 25px rgba(141, 198, 63, 0.4);
        }
        .category-card h3 {
            font-size: 18px;
            color: #333;
            font-weight: 600;
            margin-bottom: 10px;
        }
        .shop-now-btn {
            background-color: #8DC63F;
            color: #fff;
            border: none;
            padding: 8px 15px;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .shop-now-btn:hover {
            background-color: #fff;
            color: #8DC63F;
            transform: scale(1.05);
        }
        footer {
            background: rgba(0, 0, 0, 0.85);
            text-align: center;
            padding: 20px;
            color: #fff;
            font-size: 14px;
            letter-spacing: 0.5px;
        }
    </style>
</head>
<body>
<%
    HttpSession sessionObj = request.getSession(false);
    String address = null;
    boolean hasAddress = false;
    if (sessionObj != null) {
        address = (String) sessionObj.getAttribute("address");
        hasAddress = (address != null && !address.trim().isEmpty());
    }
%>

<!-- Navbar -->
<header class="top-navbar">
    <div class="nav-left">
        <% if (!hasAddress) { %>
            <!-- Add address form -->
            <form action="address" method="post" class="stylish-address-form">
                <input type="text" id="address" name="address" placeholder="Enter your address" required>
                <button type="submit">Save</button>
            </form>
        <% } else { %>
            <!-- Show and edit address -->
            <form action="address" method="post" class="stylish-address-form">
                <span class="address-text"><%= address %></span>
                <button type="submit" class="edit-btn" title="Edit">&#9998;</button>
            </form>
        <% } %>
    </div>

    <div class="nav-right">
        <a href="profile.jsp">
            <img src="./resources/profile-logo.jpg" alt="Profile" class="profile-logo">
        </a>
    </div>
</header>

<!-- Hero Section -->
<section class="hero">
    <h1>Welcome to <span>GroceMe</span></h1>
    <p>Shop your daily essentials easily and quickly</p>
</section>

<!-- Categories Section -->
<section class="categories">
    <div class="category-card">
        <img src="./resources/electronics.jpg" alt="Electronics">
        <h3>Electronics</h3>
<button class="shop-now-btn" onclick="location.href='products?category=Electronics'">Shop Now</button>
    </div>
    <div class="category-card">
        <img src="./resources/beauty.jpg" alt="Beauty">
        <h3>Beauty & Care</h3>
<button class="shop-now-btn" onclick="location.href='products?category=Beauty%20%26%20Care'">Shop Now</button>
    </div>
    <div class="category-card">
        <img src="./resources/fruits.jpg" alt="Fresh Fruits">
        <h3>Fresh Fruits</h3>
<button class="shop-now-btn" onclick="location.href='products?category=Fresh%20Fruits'">Shop Now</button>
    </div>
    <div class="category-card">
        <img src="./resources/veggi.jpg" alt="Vegetables">
        <h3>Vegetables</h3>
<button class="shop-now-btn" onclick="location.href='products?category=Vegetables'">Shop Now</button>
    </div>
    <div class="category-card">
        <img src="./resources/snack.jpg" alt="Groceries">
        <h3>All Groceries</h3>
<button class="shop-now-btn" onclick="location.href='products?category=All Groceries'">Shop Now</button>
    </div>
</section>

<!-- Footer -->
<footer>
    <p>© 2025 GroceMe | Freshness Delivered, Grocery Wise</p>
</footer>

</body>
</html>
