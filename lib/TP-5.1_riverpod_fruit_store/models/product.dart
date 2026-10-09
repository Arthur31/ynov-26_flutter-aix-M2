import 'package:flutter/foundation.dart';

@immutable
class Product {
  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imagePath,
  });

  final int id;
  final String name;
  final double price;
  final String imagePath;
}

const products = [
  Product(
    id: 1,
    name: 'Pomme',
    price: 2.20,
    imagePath: 'assets/fruits_images/apple.png',
  ),
  Product(
    id: 2,
    name: 'Orange',
    price: 2.80,
    imagePath: 'assets/fruits_images/orange.png',
  ),
  Product(
    id: 3,
    name: 'Bananes',
    price: 2.50,
    imagePath: 'assets/fruits_images/bananas.png',
  ),
  Product(
    id: 4,
    name: 'Mangue',
    price: 4.50,
    imagePath: 'assets/fruits_images/mango.png',
  ),
  Product(
    id: 5,
    name: 'Ananas',
    price: 5.20,
    imagePath: 'assets/fruits_images/pineapple.png',
  ),
  Product(
    id: 6,
    name: 'Pastèque',
    price: 6.90,
    imagePath: 'assets/fruits_images/watermelon.png',
  ),
];
