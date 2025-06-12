import 'package:flutter/material.dart';
import 'package:pdv_patrick/src/models/product.dart';
import 'package:pdv_patrick/src/models/shopping_cart.dart';
import 'package:pdv_patrick/src/pages/cart_page.dart';
import 'package:pdv_patrick/src/pages/product_page.dart';
import 'package:pdv_patrick/src/pages/register_product_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> lProducts = <Product>[
    Product(
      id: DateTime.now().millisecondsSinceEpoch,
      name: 'Anel',
      description: "apenas um anel",
      image:
          "https://images.tcdn.com.br/img/img_prod/667092/anel_ouro_10k_noivado_delicado_zirconia_3269_1_9966683bcdb7b626bd12b058d4110141_20220930105005.jpg",
      price: 450,
    ),
    Product(
      id: DateTime.now().millisecondsSinceEpoch + 1,
      name: 'Iphone',
      description: "Iphone XE",
      image:
          "https://fastshopbr.vtexassets.com/arquivos/ids/495241/0_AEMPUR3BRABCO_PRD_1500_1.jpg",
      price: 1500,
    ),
  ];

  var myCart = ShoppingCart(cartProducts: []);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDV", style: TextStyle(color: Color(0xFFFAFFCA))),
        backgroundColor: Color(0xFF5A827E),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RegisterProductPage(
                onConfirmCreate: (product) {
                  setState(() {
                    lProducts.add(product);
                  });
                },
              ),
            ),
          );
        },
        backgroundColor: Color(0xFF5A827E),
        child: Icon(Icons.add, color: Color(0xFFFAFFCA)),
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(shoppingCart: myCart),
                ),
              );
            },
            child: const Text(
              "Ver carrinho",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: lProducts.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var product = lProducts[index];

                return Row(
                  children: [
                    Expanded(
                      child: Card(
                        color: Color(0xFFB9D4AA),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductPage(
                                  product: product,
                                  onAddCart: (product) {
                                    myCart.addProduct(product);
                                  },
                                ),
                              ),
                            );
                          },
                          child: ListTile(
                            title: Text(product.name),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                product.image,
                              ), // ou AssetImage
                            ),
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
