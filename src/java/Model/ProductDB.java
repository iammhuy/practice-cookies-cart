package model;

public class ProductDB {
    public static Product selectProduct(String productCode) {
        if (productCode == null) return null;
        switch (productCode) {
            case "8601":
                return new Product("8601", "86 (the band) - True Life Songs and Pictures", 14.95);
            case "pf01":
                return new Product("pf01", "Paddlefoot - The first CD", 12.95);
            case "pf02":
                return new Product("pf02", "Paddlefoot - The second CD", 14.95);
            case "jr01":
                return new Product("jr01", "Joe Rut - Genuine Wood Grained Finish", 14.95);
            default:
                return null;
        }
    }
}
