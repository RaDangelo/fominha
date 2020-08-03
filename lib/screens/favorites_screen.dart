import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  static const routeName = '/favorites';

  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            mealId: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            duration: favoriteMeals[index].duration,
            imageUrl: favoriteMeals[index].imageUrl,
            complexity: favoriteMeals[index].complexity,
            affordability: favoriteMeals[index].affordability,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
