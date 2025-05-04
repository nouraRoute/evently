import 'package:evently/models/category_model.dart';

class EventDataModel {
  String title;
  String description;
  bool isFav;
  DateTime dateTime;
  CategoryValues categoryValues;
  EventDataModel(
      {required this.categoryValues,
      required this.dateTime,
      required this.description,
      required this.isFav,
      required this.title});

  static List<EventDataModel> get dummyData => List.generate(
        8,
        (index) => EventDataModel(
            categoryValues: CategoryValues.bookClub,
            dateTime: DateTime(2025, 5, index),
            description: 'xxxx' * index * 2,
            isFav: index % 2 == 0,
            title: 'title$index'),
      );
}
