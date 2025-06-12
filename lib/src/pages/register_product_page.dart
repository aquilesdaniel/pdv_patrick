import 'package:flutter/material.dart';
import 'package:pdv_patrick/src/models/product.dart';

class RegisterProductPage extends StatefulWidget {
  final void Function(Product newProduct) onConfirmCreate;

  const RegisterProductPage({super.key, required this.onConfirmCreate});

  @override
  State<RegisterProductPage> createState() => _RegisterProductPageState();
}

class _RegisterProductPageState extends State<RegisterProductPage> {
  var txtName = TextEditingController();
  var txtDescription = TextEditingController();
  var txtValor = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF5A827E),
          title: Text(
            "Cadastrar Produto",
            style: TextStyle(color: Color(0xFFFAFFCA)),
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(children: [Text("Nome")]),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: txtName,
                      validator: validate,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(children: [Text("Valor")]),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: txtValor,
                      validator: validate,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(children: [Text("Descrição")]),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: txtDescription,
                      validator: validate,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF5A827E),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          var price = double.parse(txtValor.text);

                          var product = Product(
                            id: DateTime.now().millisecondsSinceEpoch,
                            name: txtName.text,
                            description: txtDescription.text,
                            image: "https://i.imgur.com/gmOtPQ7.png",
                            price: price,
                          );

                          widget.onConfirmCreate(product);

                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        "Confirmar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancelar",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? validate(String? value) {
    if (value == null) {
      return "Campo é obrigatório!";
    }

    if (value.isEmpty) {
      return "Campo é obrigatório!";
    }

    return null;
  }
}
