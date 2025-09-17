<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="controller.LineItem" %>

<!DOCTYPE html>
<html>
<head>
    <title>Checkout</title>
    <link rel="stylesheet" href="Styles/main.css">
</head>
<body>
    <h2>Checkout</h2>

    <h3>Your Order</h3>
    <table>
        <tr>
            <th>Quantity</th>
            <th>Description</th>
            <th>Price</th>
            <th>Amount</th>
        </tr>
        <%
            ArrayList<LineItem> cart = (ArrayList<LineItem>) session.getAttribute("cart");
            double total = 0.0;
            if (cart != null && !cart.isEmpty()) {
                for (LineItem item : cart) {
                    double amount = item.getTotal();
                    total += amount;
        %>
        <tr>
            <td><%= item.getQuantity() %></td>
            <td><%= item.getProduct().getDescription() %></td>
            <td>$<%= item.getProduct().getPrice() %></td>
            <td>$<%= String.format("%.2f", amount) %></td>
        </tr>
        <%      }
            } else {
        %>
        <tr><td colspan="4">Your cart is empty.</td></tr>
        <% } %>
        <tr>
            <td colspan="3" style="text-align: right;"><b>Total:</b></td>
            <td><b>$<%= String.format("%.2f", total) %></b></td>
        </tr>
    </table><br>


    <form action="index.html" method="get">
        <input type="submit" value="Continue Shopping">
    </form>
</body>
</html>
