import 'package:evently/models/category_model.dart';
import 'package:flutter/material.dart';

class HomeTabProvider extends ChangeNotifier {
  CategoryValues? selectedCategory;
  editSelectedCategory(CategoryValues categoryValue) {
    selectedCategory = categoryValue;
    notifyListeners();
  }
}
