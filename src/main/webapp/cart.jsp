<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Your Cart - GroceMe</title>
    <style>
        body { font-family: 'Poppins', sans-serif; background-color: #f8f9fa; margin: 0; padding: 20px; }
        h1 { text-align: center; color: #333; }
        table { width: 80%; margin: 30px auto; border-collapse: collapse; background: white; box-shadow: 0 3px 10px rgba(0,0,0,0.1); }
        th, td { padding: 15px; border-bottom: 1px solid #ddd; text-align: center; }
        th { background-color: #8DC63F; color: white; }
        .btn { background-color: #8DC63F; color: white; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer; font-weight: 600; }
        .btn:hover { background-color: #6fa42e; }
        .empty { text-align: center; font-size: 18px; color: #777; margin-top: 50px; }
        .summary { text-align: center; margin-top: 20px; font-size: 18px; }
    </style>
</head>
<body>

<h1>Your Cart</h1>

<%
    List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");
    if (cart == null || cart.isEmpty()) {
%>
    <p class="empty">Your cart is empty! <a href="dashboard.jsp">Continue Shopping</a></p>
<%
    } else {
        double total = 0;
%>
    <table>
        <tr>
            <th>Product</th>
            <th>Price (₹)</th>
            <th>Quantity</th>
            <th>Total (₹)</th>
        </tr>
<%
        for (Map<String, Object> item : cart) {
            total += (double) item.get("total");
%>
        <tr>
            <td><%= item.get("name") %></td>
            <td><%= item.get("price") %></td>
            <td><%= item.get("qty") %></td>
            <td><%= item.get("total") %></td>
        </tr>
<%
        }
%>
    </table>

    <div class="summary">
        <p><strong>Grand Total: ₹<%= total %></strong></p>
        <form action="order.jsp" method="post">
            <button type="submit" class="btn">Proceed to Order</button>
        </form>
    </div>
<%
    }
%>

</body>
</html>
