import 'package:DevJobs/models/category.dart';

class Categories {
  final List<Category> _categoryList = [
    Category(
      name: 'software developer',
      imageUrl: 'assets/images/software-developer.jpg',
    ),
    Category(
      name: 'software engineer',
      imageUrl: 'assets/images/software-engineer.jpg',
    ),
    Category(
      name: 'fullstack developer',
      imageUrl: 'assets/images/fullstack.png',
    ),
    Category(
      name: 'web developer',
      imageUrl: 'assets/images/web-developer.jpg',
    ),
    Category(
      name: 'backend developer',
      imageUrl: 'assets/images/backend.png',
    ),
    Category(
      name: 'java',
      imageUrl: 'assets/images/java.png',
    ),
    Category(
      name: 'android',
      imageUrl: 'assets/images/android.jpg',
    ),
    Category(
      name: 'python',
      imageUrl: 'assets/images/python.jpg',
    ),
    Category(
      name: 'testing',
      imageUrl: 'assets/images/testing.jpg',
    ),
    Category(
      name: 'javascript',
      imageUrl: 'assets/images/javascript.jpg',
    ),
  ];

  List<Category> get getCategories {
    return [..._categoryList];
  }
}
