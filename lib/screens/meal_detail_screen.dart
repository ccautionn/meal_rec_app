import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  const MealDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text('$mealId')),
      body: Container(
        child: Text('The Meal - $mealId!'),
      ),
    );
  }
}
