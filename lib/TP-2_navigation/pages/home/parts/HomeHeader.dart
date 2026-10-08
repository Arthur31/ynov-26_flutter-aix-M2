import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.titleLarge
        ?.copyWith(color: Colors.white, fontWeight: .bold);
    return Container(
      height: 100,
      color: Colors.pinkAccent,
      child: Center(child: Text("My Fruit Store", style: textTheme)),
    );
  }
}
