import 'package:flutter/material.dart';

import '../data/data.dart';
import '../models/category.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final categoryArg = ModalRoute.of(context).settings.arguments as Category;
    final Category category = categoryArg;
    final List<Meal> categoryMeals = DATA_MEALS.where((meal) => meal.categories.contains(category.id)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(meal: categoryMeals[index]);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
