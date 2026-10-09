import 'package:aix_1/TP-5.2_riverpod_fruit_store/models/cart_item.dart';
import 'package:aix_1/TP-5.2_riverpod_fruit_store/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartAdvancedNotifier extends Notifier<List<CartItem>> {
  @override
  List<CartItem> build() => const [];

  // Ajouter un produit (ou incrémenter sa quantité s'il existe déjà)
  void add(Product product) {
    final index = state.indexWhere((item) => item.product.id == product.id);

    if (index >= 0) {
      // Le produit existe déjà : on met à jour uniquement sa quantité
      final existingItem = state[index];
      final updatedItem = existingItem.copyWith(
        quantity: existingItem.quantity + 1,
      );

      // On crée une nouvelle liste pour notifier Riverpod du changement
      state = [
        for (int i = 0; i < state.length; i++)
          if (i == index) updatedItem else state[i],
      ];
    } else {
      // Le produit n'existe pas : on l'ajoute avec une quantité initiale de 1
      state = [...state, CartItem(product: product, quantity: 1)];
    }
  }

  // Diminuer la quantité ou retirer le produit s'il n'en reste qu'un
  void removeProduct(Product product) {
    final index = state.indexWhere((item) => item.product.id == product.id);
    if (index == -1) return;

    final existingItem = state[index];

    if (existingItem.quantity > 1) {
      // On décrémente la quantité
      final updatedItem = existingItem.copyWith(
        quantity: existingItem.quantity - 1,
      );
      state = [
        for (int i = 0; i < state.length; i++)
          if (i == index) updatedItem else state[i],
      ];
    } else {
      // S'il n'y avait qu'un seul article, on le supprime complètement
      state = state.where((item) => item.product.id != product.id).toList();
    }
  }

  // Supprimer complètement un produit (quelles que soient ses quantités)
  void clearProductCompletely(String productId) {
    state = state.where((item) => item.product.id != productId).toList();
  }
}

final cartAdvancedNotifierProvider =
    NotifierProvider<CartAdvancedNotifier, List<CartItem>>(
      CartAdvancedNotifier.new,
    );

final cartItemCountProvider = Provider<int>((ref) {
  return ref.watch(cartAdvancedNotifierProvider).length;
});

final cartAdvancedTotalProvider = Provider<double>((ref) {
  return ref
      .watch(cartAdvancedNotifierProvider)
      .fold(0, (total, cartItem) => total + cartItem.totalPrice);
});

final productQuantityInCartProvider = Provider.family<int, int>((
  ref,
  productId,
) {
  final cartList = ref.watch(cartAdvancedNotifierProvider);
  final index = cartList.indexWhere((item) => item.product.id == productId);
  return index != -1 ? cartList[index].quantity : 0;
});
