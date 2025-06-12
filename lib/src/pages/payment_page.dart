import 'package:flutter/material.dart';
import 'package:pdv_patrick/src/models/shopping_cart.dart';
import 'package:pdv_patrick/src/pages/last_page.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PaymentPage extends StatefulWidget {
  final ShoppingCart shoppingCart;

  const PaymentPage({super.key, required this.shoppingCart});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  var qrCodeString = "";

  @override
  Widget build(BuildContext context) {
    qrCodeString = <String, String>{
      "precoTotal": "${widget.shoppingCart.totalPrice}",
      "data": DateTime.now().toIso8601String(),
    }.toString();

    return Scaffold(
      appBar: AppBar(
        title: Text("Pagamento", style: TextStyle(color: Color(0xFFFAFFCA))),
        backgroundColor: Color(0xFF5A827E),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: const Color(0xFF5A827E),
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      LastPage(shoppingCart: widget.shoppingCart),
                ),
                (route) => false,
              );
            },
            child: const Text(
              "Pagar",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ),

      body: Column(
        children: [
          QrImageView(
            data: qrCodeString,
            version: QrVersions.auto,
            size: 200.0,
            backgroundColor: Colors.white,
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: const Color(0xFF5A827E),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            LastPage(shoppingCart: widget.shoppingCart),
                      ),
                      (route) => false,
                    );
                  },
                  child: Text(
                    "Cartão débito",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: const Color(0xFF5A827E),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            LastPage(shoppingCart: widget.shoppingCart),
                      ),
                      (route) => false,
                    );
                  },
                  child: Text(
                    "Cartão Crédito",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: const Color(0xFF5A827E),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            LastPage(shoppingCart: widget.shoppingCart),
                      ),
                      (route) => false,
                    );
                  },
                  child: Text(
                    "Dinheiro",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
