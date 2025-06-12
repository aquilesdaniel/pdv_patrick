import 'package:flutter/material.dart';
import 'package:pdv_patrick/src/models/shopping_cart.dart';
import 'package:pdv_patrick/src/pages/home_page.dart';

class LastPage extends StatefulWidget {
  final ShoppingCart shoppingCart;

  const LastPage({super.key, required this.shoppingCart});

  @override
  State<LastPage> createState() => _LastPageState();
}

class _LastPageState extends State<LastPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Compra Concluida",
          style: TextStyle(color: Color(0xFFFAFFCA)),
        ),
        backgroundColor: Color(0xFF5A827E),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Compra concluida com sucesso!"),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    widget.shoppingCart.clearAll();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                      (route) => false,
                    );
                  },
                  child: Text("Recomeçar"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
