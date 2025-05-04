import 'package:evently/common/app_assets.dart';
import 'package:flutter/material.dart';

class CategoryModel {
  CategoryValues categoryValues;
  String title;
  IconData iconData;
  CategoryModel({
    required this.iconData,
    required this.title,
    required this.categoryValues,
  });
  static List<CategoryModel> get categories => [
        CategoryModel(
            iconData: Icons.explore_outlined,
            title: CategoryValues.all.toTitle(),
            categoryValues: CategoryValues.all),
        CategoryModel(
            iconData: Icons.directions_bike,
            title: CategoryValues.sport.toTitle(),
            categoryValues: CategoryValues.sport),
        CategoryModel(
            iconData: Icons.cake_outlined,
            title: CategoryValues.birthdays.toTitle(),
            categoryValues: CategoryValues.birthdays),
        CategoryModel(
            iconData: Icons.book_outlined,
            title: CategoryValues.bookClub.toTitle(),
            categoryValues: CategoryValues.bookClub),
      ];
}

enum CategoryValues {
  all,
  sport,
  birthdays,
  bookClub;

  String toTitle() {
    return name[0].toUpperCase() + name.substring(1);
  }

  String getDesign() {
    switch (this) {
      case CategoryValues.all:
        return '';
      case CategoryValues.sport:
        return AppAssets.categorySportDesign;
      case CategoryValues.birthdays:
        return AppAssets.categoryBirthdayDesign;
      case CategoryValues.bookClub:
        return AppAssets.categoryBookClubDesign;
    }
  }
}
