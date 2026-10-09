import 'package:aix_1/TP-5.1_riverpod_fruit_store/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends Notifier<List<Product>> {
  @override
  List<Product> build() => List.empty();

  void add(Product product) => state = [...state, product];
  void removeProduct(Product product) {
    final index = state.indexWhere((item) => item.id == product.id);
    if (index == -1) return;
    state = [...state]..removeAt(index);
  }
}

final cartNotifierProvider = NotifierProvider<CartNotifier, List<Product>>(
  CartNotifier.new,
);

final cartTotalProvider = Provider<double>((ref) {
  return ref
      .watch(cartNotifierProvider)
      .fold(0, (total, product) => total + product.price);
});
