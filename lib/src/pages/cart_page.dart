import 'package:flutter/material.dart';
import 'package:pdv_patrick/src/models/shopping_cart.dart';
import 'package:pdv_patrick/src/pages/payment_page.dart';

class CartPage extends StatefulWidget {
  final ShoppingCart shoppingCart;

  const CartPage({super.key, required this.shoppingCart});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carrinho", style: TextStyle(color: Color(0xFFFAFFCA))),
        backgroundColor: Color(0xFF5A827E),
      ),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: 120,
          child: Column(
            children: [
              Text(
                "Total: R\$ ${widget.shoppingCart.totalPrice.toStringAsFixed(2).replaceAll('.', ',')}",
              ),
              SizedBox(height: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 12,
                  ),
                  backgroundColor: const Color(0xFF5A827E),
                ),
                onPressed: widget.shoppingCart.cartProducts.isNotEmpty
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PaymentPage(shoppingCart: widget.shoppingCart),
                          ),
                        );
                      }
                    : null,
                child: const Text(
                  "Finalizar Compra!",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 12,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Voltar",
                  style: TextStyle(fontSize: 16, color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.shoppingCart.cartProducts.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var cartProductDetails =
                    widget.shoppingCart.cartProducts[index];
                var product = cartProductDetails.product;
                var price = widget.shoppingCart.totalPriceByProduct(product);

                return Row(
                  children: [
                    Expanded(
                      child: Card(
                        color: Color(0xFFB9D4AA),
                        child: ListTile(
                          title: Text(product.name),
                          subtitle: Text(
                            "R\$ ${price.toStringAsFixed(2).replaceAll('.', ',')}",
                          ),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              product.image,
                            ), // ou AssetImage
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            // Impede que o Row estique demais
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  setState(() {
                                    widget.shoppingCart.removeProduct(product);
                                  });
                                },
                              ),
                              Text(cartProductDetails.quantity.toString()),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  setState(() {
                                    widget.shoppingCart.addProduct(product);
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
