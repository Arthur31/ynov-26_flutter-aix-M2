import 'package:aix_1/TP-5.2_riverpod_fruit_store/models/product.dart';
import 'package:flutter/material.dart';

@immutable
class CartItem {
  final Product product;
  final int quantity;

  const CartItem({required this.product, required this.quantity});

  // Calcul automatique du prix total pour cette ligne du panier
  double get totalPrice => product.price * quantity;

  // Permet de créer une copie en modifiant uniquement la quantité
  CartItem copyWith({int? quantity}) {
    return CartItem(product: product, quantity: quantity ?? this.quantity);
  }
}
