package controller;
import model.Product;
public class LineItem {
    private Product product;
    private int quantity;

    public LineItem() {}

    public void setProduct(Product product) {
        this.product = product;
    }

    public Product getProduct() {
        return product;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getTotal() {
        return product.getPrice() * quantity;
    }
}
