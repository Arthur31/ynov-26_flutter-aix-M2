import 'package:aix_1/TP-2_navigation/pages/detail/parts/nutrition_row.dart';
import 'package:aix_1/TP-2_navigation/models/product.dart';
import 'package:flutter/material.dart';

class NutritonInfo extends StatelessWidget {
  final Product product;
  const new({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 350),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.grey.shade300),
      child: Column(
        children: [
          NutritionRow(
            label: "Sugar (pour 100g)",
            value: product.sugarGramsPer100g.toStringAsFixed(2),
          ),
          NutritionRow(
            label: "Calories (pour 100g)",
            value: product.calories.toStringAsFixed(0),
          ),
          NutritionRow(label: "Categorie", value: product.category),
          NutritionRow(label: "Saison", value: product.season),
          NutritionRow(label: "Bio", value: product.isBio ? "Oui" : "Non"),
        ],
      ),
    );
  }
}
