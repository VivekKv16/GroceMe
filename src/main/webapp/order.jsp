<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation - GroceMe</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
        font-family: 'Poppins', sans-serif;
                    background: url('./resources/fruits.jpg') center/cover no-repeat fixed;
                    color: #333;
            background-color: #f4f7f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .order-container {
            background-color: #fff;
            width: 460px;
            padding: 40px 30px;
            border-radius: 18px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.12);
            text-align: center;
            animation: fadeIn 0.6s ease;
        }

        .order-image img {
            width: 180px;
            height: auto;
            margin-bottom: 20px;
        }

        .order-container h1 {
            color: #8DC63F;
            font-size: 28px;
            margin-bottom: 10px;
            font-weight: 600;
        }

        .order-container p {
            color: #555;
            font-size: 16px;
            margin-bottom: 30px;
        }

        .btn {
            display: inline-block;
            background-color: #8DC63F;
            color: #fff;
            text-decoration: none;
            padding: 12px 30px;
            border-radius: 8px;
            font-weight: 600;
            transition: 0.3s;
        }

        .btn:hover {
            background-color: #6fa42e;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(15px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

    <div class="order-container">
        <div class="order-image">
            <img src="resources/about.jpg" alt="Order Success">
        </div>
        <h1>Order Placed Successfully!</h1>
        <p>Thank you for shopping with <strong>GroceMe</strong>.<br>Your groceries will be delivered soon.</p>
        <a href="dashboard.jsp" class="btn">Go Back to Dashboard</a>
    </div>

</body>
</html>
