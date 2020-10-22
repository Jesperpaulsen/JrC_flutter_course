import 'package:JrC_flutter_course/models/meal.dart';
import 'package:JrC_flutter_course/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  // Step 3
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty
        ? Center(
            child: Text('You have no favorites yet - start adding some!'),
          )
        // Step 4
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(
                id: favoriteMeals[index].id,
                title: favoriteMeals[index].title,
                imageUrl: favoriteMeals[index].imageUrl,
                duration: favoriteMeals[index].duration,
                affordability: favoriteMeals[index].affordability,
                complexity: favoriteMeals[index].complexity,
              );
            },
            itemCount: favoriteMeals.length,
          );
  }
}
