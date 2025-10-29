<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title><%= request.getAttribute("category") %> - GroceMe</title>
    <style>
        body { font-family: 'Poppins', sans-serif; background: #f7f7f7; margin: 0; padding: 40px; }
        .product-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 30px; }
        .product-card { background: #fff; border-radius: 15px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); padding: 20px; text-align: center; }
        .product-card img { width: 160px; height: 160px; object-fit: cover; border-radius: 10px; }
        .product-card h3 { margin: 10px 0; }
        .quantity { display: flex; justify-content: center; align-items: center; margin: 10px 0; }
        .quantity button { background: #8DC63F; border: none; color: white; padding: 5px 10px; cursor: pointer; border-radius: 5px; font-size: 16px; }
        .quantity input { width: 40px; text-align: center; margin: 0 8px; border: 1px solid #ccc; border-radius: 5px; }
        .add-btn { background: #8DC63F; color: #fff; border: none; padding: 10px 20px; border-radius: 8px; cursor: pointer; }
        .add-btn:hover { background: #76b232; }
    </style>
</head>
<body>

<h1><%= request.getAttribute("category") %> Products</h1>
<div class="product-grid">
<%
    List<String[]> products = (List<String[]>) request.getAttribute("products");
    if (products != null) {
        for (String[] p : products) {
%>
    <div class="product-card">
        <img src="<%= p[3] %>" alt="<%= p[0] %>">
        <h3><%= p[0] %></h3>
        <p><%= p[1] %></p>
        <p><strong>₹<%= p[2] %></strong></p>

    <form action="cart" method="post">
        <input type="hidden" name="productName" value="<%= p[0] %>">
        <input type="hidden" name="price" value="<%= p[1] %>">

        <div class="quantity">
            <button type="button" onclick="changeQty(this, -1)">-</button>
            <input type="text" name="qty" value="1">
            <button type="button" onclick="changeQty(this, 1)">+</button>
        </div>

        <button type="submit" class="add-btn">Add to Cart</button>
    </form>

    <style>
    .quantity {
        display: flex;
        align-items: center;
        justify-content: center;
        margin-bottom: 10px;
    }

    .quantity button {
        background-color: #8DC63F;
        color: white;
        border: none;
        padding: 5px 10px;
        font-size: 16px;
        cursor: pointer;
        border-radius: 5px;
    }

    .quantity input {
        width: 40px;
        text-align: center;
        border: 1px solid #ccc;
        border-radius: 5px;
        margin: 0 8px;
        padding: 5px;
    }

    .add-btn {
        background-color: #8DC63F;
        color: white;
        border: none;
        padding: 8px 16px;
        border-radius: 8px;
        font-weight: 600;
        cursor: pointer;
        transition: 0.3s;
    }

    .add-btn:hover {
        background-color: #6fa42e;
        transform: scale(1.05);
    }
    </style>

    <script>
    function changeQty(btn, delta) {
        const input = btn.parentNode.querySelector('input[name="qty"]');
        let value = parseInt(input.value) || 1;
        value = Math.max(1, value + delta);
        input.value = value;
    }
    </script>

    </div>
<%
        }
    }
%>
</div>

<script>
function changeQty(btn, val) {
    const input = btn.parentNode.querySelector("input");
    let qty = parseInt(input.value) + val;
    if (qty < 1) qty = 1;
    input.value = qty;
}
</script>

</body>
</html>
