import 'package:flutter/material.dart';
import 'package:recipes_app/category_item.dart';
import 'package:recipes_app/dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 10 / 12),
      itemCount: dummyCategories.length,
      itemBuilder: (context, index) {
        final category = dummyCategories[index];
        return CategoryItem(
          id: category.id,
          title: category.title,
          images: category.images,
        );
      },
    );
  }
}
