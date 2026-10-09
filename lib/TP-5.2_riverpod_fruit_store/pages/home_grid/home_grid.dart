import 'package:aix_1/TP-5.2_riverpod_fruit_store/models/product.dart';
import 'package:aix_1/TP-5.2_riverpod_fruit_store/providers/cart_advanced_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeGrid extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: GridView.builder(
        padding: EdgeInsets.all(12),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisExtent: 280,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          return GridTile(
            header: Container(
              color: Colors.white.withAlpha(200),
              padding: const EdgeInsets.all(4),
              child: Column(
                mainAxisSize: .min,
                children: [
                  Text(product.name, textAlign: .center),
                  Text("${product.price.toStringAsFixed(2)} €"),
                ],
              ),
            ),
            footer: Footer(product: product),
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Image.asset(product.imagePath, fit: BoxFit.contain),
            ),
          );
        },
      ),
    );
  }
}

class Footer extends ConsumerWidget {
  final Product product;

  const Footer({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(cartAdvancedNotifierProvider.notifier);
    final productQuantity = ref.watch(
      productQuantityInCartProvider(product.id),
    );

    if (productQuantity == 0) {
      return FilledButton.icon(
        onPressed: () => notifier.add(product),
        icon: const Icon(Icons.add_shopping_cart, size: 18),
        label: const Text("Ajouter"),
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: FilledButton(
              onPressed: () => notifier.add(product),
              style: ButtonStyle(padding: .all(EdgeInsets.zero)),
              child: const Icon(Icons.add),
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: CircleAvatar(
              // Rendu plus propre pour afficher le chiffre
              radius: 16,
              child: Text(productQuantity.toInt().toString()),
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: FilledButton(
              style: ButtonStyle(padding: .all(EdgeInsets.zero)),
              onPressed: () => notifier.removeProduct(product),
              child: const Icon(Icons.remove),
            ),
          ),
        ],
      );
    }
  }
}
