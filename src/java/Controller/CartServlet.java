package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import model.Product;
import model.ProductDB;
public class CartServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Lấy session (nếu chưa có thì tạo mới)
        HttpSession session = request.getSession();
        
        // Lấy giỏ hàng từ session
        ArrayList<LineItem> cart = (ArrayList<LineItem>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }

        // Lấy productCode từ request
        String productCode = request.getParameter("productCode");
        String action = request.getParameter("action");

        if (action == null) {
            action = "add";  // mặc định là thêm sản phẩm
        }

        if (action.equals("add")) {
            Product product = ProductDB.selectProduct(productCode); // Lấy sản phẩm từ "database"
            if (product != null) {
                boolean found = false;
                for (LineItem item : cart) {
                    if (item.getProduct().getCode().equals(productCode)) {
                        item.setQuantity(item.getQuantity() + 1);
                        found = true;
                        break;
                    }
                }
                if (!found) {
                    LineItem newItem = new LineItem();
                    newItem.setProduct(product);
                    newItem.setQuantity(1);
                    cart.add(newItem);
                }
            }
        } 
        else if (action.equals("update")) {
            String qtyString = request.getParameter("quantity");
            String code = request.getParameter("productCode");
            int qty = Integer.parseInt(qtyString);
            for (LineItem item : cart) {
                if (item.getProduct().getCode().equals(code)) {
                    if (qty > 0) {
                        item.setQuantity(qty);
                    } else {
                        cart.remove(item);
                    }
                    break;
                }
            }
        } 
        else if (action.equals("remove")) {
            String code = request.getParameter("productCode");
            cart.removeIf(item -> item.getProduct().getCode().equals(code));
        }

        // Lưu lại giỏ hàng vào session
        session.setAttribute("cart", cart);

        // Forward đến cart.jsp
        String url = "/cart.jsp";
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
