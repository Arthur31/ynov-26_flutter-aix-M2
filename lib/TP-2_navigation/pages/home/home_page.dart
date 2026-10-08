import 'package:aix_1/TP-2_navigation/pages/home/parts/HomeHeader.dart';
import 'package:aix_1/TP-2_navigation/models/product.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HomeHeader(),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  leading: Image.asset(product.imagePath),
                  title: Text(product.name),
                  onTap: () => context.push('/detail/', extra: product),
                  // onTap: () => context.push('/detail/${product.name}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
