import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoriteScreen({super.key, required this.favoriteMeals});

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text('You have no favorites - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: ((context, index) {
          return MealItem(
              title: favoriteMeals[index].title,
              imageUrl: favoriteMeals[index].imageUrl,
              duration: favoriteMeals[index].duration,
              complexity: favoriteMeals[index].complexity,
              affordability: favoriteMeals[index].affordability,
              id: favoriteMeals[index].id);
        }),
        itemCount: favoriteMeals.length,
      );
    }
  }
}
