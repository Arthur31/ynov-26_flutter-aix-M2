import 'package:aix_1/TP-5.1_riverpod_fruit_store/models/product.dart';
import 'package:aix_1/TP-5.1_riverpod_fruit_store/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeGrid extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(cartNotifierProvider.notifier);
    return Scaffold(
      body: GridView.builder(
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 2 / 3,
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          return Container(
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsetsGeometry.all(20),
                    child: Image.asset(product.imagePath),
                  ),
                ),
                Text(product.name),
                FilledButton(
                  onPressed: () => notifier.add(product),
                  child: Text("${product.price.toStringAsFixed(2)} €"),
                ),
              ],
            ),

            // onTap: () => context.push('/detail/${product.name}'),
          );
        },
      ),
    );
  }
}
