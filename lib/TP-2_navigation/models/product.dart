import 'package:flutter/foundation.dart';

@immutable
class Product {
  final int id;
  final String name;
  final double price;
  final String imagePath;
  final double sugarGramsPer100g;
  final int calories;
  final String category;
  final bool isBio;
  final String season;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.sugarGramsPer100g,
    required this.calories,
    required this.category,
    required this.isBio,
    required this.season,
  });
}

const products = [
  Product(
    id: 1,
    name: 'Pomme',
    price: 2.20,
    imagePath: 'assets/fruits_images/apple.png',
    sugarGramsPer100g: 10.4,
    calories: 52,
    category: 'Pépins',
    isBio: true,
    season: 'Automne',
  ),
  Product(
    id: 2,
    name: 'Orange',
    price: 2.80,
    imagePath: 'assets/fruits_images/orange.png',
    sugarGramsPer100g: 9.3,
    calories: 47,
    category: 'Agrumes',
    isBio: false,
    season: 'Hiver',
  ),
  Product(
    id: 3,
    name: 'Bananes',
    price: 2.50,
    imagePath: 'assets/fruits_images/bananas.png',
    sugarGramsPer100g: 12.2,
    calories: 89,
    category: 'Exotique',
    isBio: true,
    season: 'Toute l\'année',
  ),
  Product(
    id: 4,
    name: 'Mangue',
    price: 4.50,
    imagePath: 'assets/fruits_images/mango.png',
    sugarGramsPer100g: 13.7,
    calories: 60,
    category: 'Exotique',
    isBio: false,
    season: 'Printemps',
  ),
  Product(
    id: 5,
    name: 'Ananas',
    price: 5.20,
    imagePath: 'assets/fruits_images/pineapple.png',
    sugarGramsPer100g: 9.8,
    calories: 50,
    category: 'Exotique',
    isBio: false,
    season: 'Hiver',
  ),
  Product(
    id: 6,
    name: 'Pastèque',
    price: 6.90,
    imagePath: 'assets/fruits_images/watermelon.png',
    sugarGramsPer100g: 6.2,
    calories: 30,
    category: 'Cucurbitacées',
    isBio: true,
    season: 'Été',
  ),
];
