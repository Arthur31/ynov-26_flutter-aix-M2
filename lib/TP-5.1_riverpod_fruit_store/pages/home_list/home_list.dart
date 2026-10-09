import 'package:aix_1/TP-5.1_riverpod_fruit_store/models/product.dart';
import 'package:aix_1/TP-5.1_riverpod_fruit_store/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeList extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(cartNotifierProvider.notifier);
    return Scaffold(
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: Image.asset(product.imagePath),
            title: Text(product.name),
            trailing: Text("${product.price.toStringAsFixed(2)} €"),
            onTap: () => notifier.add(product),
            // onTap: () => context.push('/detail/${product.name}'),
          );
        },
      ),
    );
  }
}
