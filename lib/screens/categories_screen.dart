import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../dummy-data.dart';
import '../widgets/category_item.dart';

// Step 1
class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meals"),
      ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES
            .map(
              // Step 2
              (category) => CategoryItem(
                category.id,
                category.title,
                category.color,
              ),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
