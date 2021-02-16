import 'package:flutter/material.dart';

import '../screens/category_jobs.dart';
import '../styles/text_styles.dart';

class CategoryItem extends StatelessWidget {
  final String categoryName;
  final String imageUrl;

  CategoryItem({
    this.imageUrl,
    this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => CategoryJobsScreen(
              category: categoryName,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black87.withOpacity(0.65),
              BlendMode.darken,
            ),
          ),
        ),
        child: Center(
          child: Text(
            categoryName.toUpperCase(),
            softWrap: true,
            textAlign: TextAlign.center,
            style: categoryItemTextStyle,
          ),
        ),
      ),
    );
  }
}
