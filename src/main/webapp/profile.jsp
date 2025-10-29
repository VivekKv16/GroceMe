<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile | GroceMe</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: url('./resources/straberry.jpg') center/cover no-repeat fixed;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .profile-card {
            background: rgba(255, 255, 255, 0.85);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            text-align: center;
            width: 350px;
            backdrop-filter: blur(5px);
        }
        .profile-card img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            border: 3px solid #8DC63F;
            margin-bottom: 15px;
            object-fit: cover;
        }
        .profile-card h2 {
            font-size: 22px;
            color: #333;
            margin-bottom: 10px;
        }
        .profile-card p {
            font-size: 15px;
            color: #555;
            margin: 5px 0;
        }
        .profile-card button {
            background-color: #8DC63F;
            color: #fff;
            border: none;
            padding: 8px 15px;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 15px;
        }
        .profile-card button:hover {
            background-color: #fff;
            color: #8DC63F;
            transform: scale(1.05);
        }
        .back-btn {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #8DC63F;
            font-weight: 500;
        }
        .back-btn:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<%
    HttpSession sessionObj = request.getSession(false);
    String name = "";
    String phone = "";
    String address = "";
    String newAddress="";

    if (sessionObj != null) {
        name = (String) sessionObj.getAttribute("name");
        phone = String.valueOf(sessionObj.getAttribute("phone"));
        address = (String) sessionObj.getAttribute("address");

    }
%>

<div class="profile-card">
    <img src="./resources/profile-logo.jpg" alt="Profile Picture">
    <h2><%= name != null ? name : "User" %></h2>
    <p><strong>Phone:</strong> <%= phone != null ? phone : "N/A" %></p>
    <p><strong>Address:</strong> <%= (address != null && !address.trim().isEmpty()) ? address : "Not Added Yet" %></p>

    <form action="updateProfile.jsp">
        <button type="submit">Edit Profile</button>
    </form>

    <a href="dashboard.jsp" class="back-btn">← Back to Dashboard</a>
</div>

</body>
</html>
