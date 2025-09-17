<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="controller.LineItem" %>

<!DOCTYPE html>
<html>
<head>
    <title>Your cart</title>
    <link rel="stylesheet" href="Styles/main.css">
</head>
<body>
    <h2>Your cart</h2>
    <table>
        <tr>
            <th>Quantity</th>
            <th>Description</th>
            <th>Price</th>
            <th>Amount</th>
            <th></th>
        </tr>
        <%
            ArrayList<LineItem> cart = (ArrayList<LineItem>) session.getAttribute("cart");
            if (cart != null && !cart.isEmpty()) {
                for (LineItem item : cart) {
        %>
        <tr>
            <form action="cart" method="post">
                <td>
                    <input type="text" name="quantity" value="<%= item.getQuantity() %>" size="2">
                    <input type="submit" name="action" value="update">
                </td>
                <td><%= item.getProduct().getDescription() %></td>
                <td>$<%= item.getProduct().getPrice() %></td>
                <td>$<%= String.format("%.2f", item.getTotal()) %></td>
                <td>
                    <input type="hidden" name="productCode" value="<%= item.getProduct().getCode() %>">
                    <input type="submit" name="action" value="remove">
                </td>
            </form>
        </tr>
        <%      }
            } else {
        %>
        <tr><td colspan="5">Your cart is empty.</td></tr>
        <% } %>
    </table>

    <p><b>To change the quantity</b>, enter the new quantity and click on the Update button.</p>

    <form action="index.html" method="get">
        <input type="submit" value="Continue Shopping">
    </form>

    <form action="checkout.jsp" method="get">
        <input type="submit" value="Checkout">
    </form>
</body>
</html>
