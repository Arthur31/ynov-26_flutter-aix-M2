import 'package:aix_1/TP-2_navigation/pages/detail/parts/nutrition_info.dart';
import 'package:aix_1/TP-2_navigation/models/product.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Product product;
  const new({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                constraints: BoxConstraints(maxWidth: 300),
                padding: const EdgeInsets.all(10.0),
                clipBehavior: .hardEdge,
                child: Image.asset(product.imagePath),
              ),
            ),
          ),
          Center(child: NutritonInfo(product: product)),
        ],
      ),
    );
  }
}
