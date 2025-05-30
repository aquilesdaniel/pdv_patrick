import 'package:flutter/material.dart';
import 'package:pdv_patrick/src/models/product.dart';
import 'package:pdv_patrick/src/pages/register_product_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> lProducts = <Product>[
    Product(
      name: 'Anel',
      description: "apenas um anel",
      image:
          "https://images.tcdn.com.br/img/img_prod/667092/anel_ouro_10k_noivado_delicado_zirconia_3269_1_9966683bcdb7b626bd12b058d4110141_20220930105005.jpg",
      price: 450,
    ),
    Product(
      name: 'Iphone',
      description: "Iphone XE",
      image:
          "https://fastshopbr.vtexassets.com/arquivos/ids/495241/0_AEMPUR3BRABCO_PRD_1500_1.jpg",
      price: 1500,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5A827E),
        leading: Icon(Icons.menu, color: Color(0xFFFAFFCA)),
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
      body: Column(
        children: [
          ListView.builder(
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
                        onTap: () {},
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
        ],
      ),
    );
  }
}
