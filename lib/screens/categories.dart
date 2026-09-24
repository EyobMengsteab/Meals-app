import 'package:flutter/material.dart';

import 'package:exercise_4/data/dummy_data.dart';
import 'package:exercise_4/screens/meals.dart';
import 'package:exercise_4/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (ctx) => MealsScreen(title: 'Some title', meals: [],
            ),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick your category'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectedCategory: () {
                _selectCategory(context);
                },
            )
        ],
      ),
    );
  }
}