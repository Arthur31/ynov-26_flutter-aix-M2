import 'package:aix_1/TP-5.3_riverpod_generation_fruit_store/pages/home_list/home_list.dart';
import 'package:aix_1/TP-5.3_riverpod_generation_fruit_store/pages/home_grid/home_grid.dart';
import 'package:aix_1/TP-5.3_riverpod_generation_fruit_store/providers/cart_advanced_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// void main() => runApp(ProviderScope(child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: MediaQuery.of(context).size.width < 440 ? HomeList() : HomeGrid(),
        appBar: AppBar(
          title: Text("Fruit Store"),
          actionsPadding: EdgeInsets.all(8),
          actions: [
            Consumer(
              builder: (context, ref, child) {
                final total = ref.watch(cartAdvancedTotalProvider);
                return Text("Total : ${total.toStringAsFixed(2)} €");
              },
            ),
          ],
        ),
        floatingActionButton: FAB(),
      ),
    );
  }
}

class FAB extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartAdvancedProvider);
    return Badge(
      label: Text(cart.length.toString()),
      child: FloatingActionButton(
        onPressed: () => print("navigate To Cart"),
        tooltip: 'Cart',
        child: const Icon(Icons.shopping_basket_outlined),
      ),
    );
  }
}
