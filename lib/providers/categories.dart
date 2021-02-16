import '../models/category.dart';

class Categories {
  final List<Category> _categoryList = [
    Category(
      name: 'software developer',
      imageUrl: 'assets/images/categories/software-developer.jpg',
    ),
    Category(
      name: 'software engineer',
      imageUrl: 'assets/images/categories/software-engineer.jpg',
    ),
    Category(
      name: 'fullstack developer',
      imageUrl: 'assets/images/categories/fullstack.png',
    ),
    Category(
      name: 'web developer',
      imageUrl: 'assets/images/categories/web-developer.jpg',
    ),
    Category(
      name: 'backend developer',
      imageUrl: 'assets/images/categories/backend.png',
    ),
    Category(
      name: 'java',
      imageUrl: 'assets/images/categories/java.png',
    ),
    Category(
      name: 'android',
      imageUrl: 'assets/images/categories/android.jpg',
    ),
    Category(
      name: 'python',
      imageUrl: 'assets/images/categories/python.jpg',
    ),
    Category(
      name: 'testing',
      imageUrl: 'assets/images/categories/testing.jpg',
    ),
    Category(
      name: 'javascript',
      imageUrl: 'assets/images/categories/javascript.jpg',
    ),
  ];

  List<Category> get getCategories {
    return [..._categoryList];
  }
}
