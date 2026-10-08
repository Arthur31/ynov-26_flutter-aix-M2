import 'package:flutter/material.dart';

class NutritionRow extends StatelessWidget {
  final String label;
  final String value;
  const new({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(children: [Text(label), Spacer(), Text(value)]);
  }
}
