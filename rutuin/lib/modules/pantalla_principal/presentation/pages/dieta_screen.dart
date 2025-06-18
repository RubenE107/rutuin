import 'package:flutter/material.dart';

class DietaScreen extends StatelessWidget {
  const DietaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '🍽️ Tu dieta',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
