import 'package:flutter/material.dart';

import '../providers/categories.dart';
import './category_item.dart';

class CategoryJobsWidget extends StatelessWidget {
  final categoriesList = Categories().getCategories;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: categoriesList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 3 / 2,
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0),
      itemBuilder: (ctx, index) => GridTile(
        child: CategoryItem(
          categoryName: categoriesList[index].name,
          imageUrl: categoriesList[index].imageUrl,
        ),
      ),
    );
  }
}
