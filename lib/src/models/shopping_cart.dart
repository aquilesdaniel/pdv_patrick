import 'package:pdv_patrick/src/models/product.dart';
import 'package:pdv_patrick/src/models/shopping_cart_product.dart';

class ShoppingCart {
  List<ShoppingCartProduct> cartProducts;

  ShoppingCart({required this.cartProducts});

  void clearAll() {
    cartProducts = [];
  }

  void addProduct(Product productToAdd) {
    final index = cartProducts.indexWhere(
      (item) => item.product.id == productToAdd.id,
    );
    if (index != -1) {
      cartProducts[index].quantity += 1;
    } else {
      cartProducts.add(ShoppingCartProduct(product: productToAdd, quantity: 1));
    }
  }

  void removeProduct(Product productToRemove) {
    final index = cartProducts.indexWhere(
      (item) => item.product.id == productToRemove.id,
    );
    if (index != -1) {
      if (cartProducts[index].quantity == 1) {
        cartProducts.removeAt(index);
      } else {
        cartProducts[index].quantity -= 1;
      }
    }
  }

  double get totalPrice {
    return cartProducts.fold(
      0.0,
      (sum, item) => sum + (item.product.price * item.quantity),
    );
  }

  double totalPriceByProduct(Product product) {
    final cartProduct = cartProducts.firstWhere(
      (p) => p.product.id == product.id,
      orElse: () => ShoppingCartProduct(product: product, quantity: 0),
    );

    return cartProduct.product.price * cartProduct.quantity;
  }
}
