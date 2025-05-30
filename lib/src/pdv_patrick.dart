import 'package:flutter/material.dart';

import 'pages/home_page.dart';

class PdvPatrick extends StatelessWidget {
  const PdvPatrick({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "PDV", home: HomePage(), debugShowCheckedModeBanner: false);
  }
}
