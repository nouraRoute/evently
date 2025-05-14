import 'package:evently/models/category_model.dart';

class EventDataModel {
  String id;
  String title;
  String description;
  bool isFav;
  DateTime dateTime;
  CategoryValues categoryValues;
  EventDataModel(
      {this.id = '',
      required this.categoryValues,
      required this.dateTime,
      required this.description,
      this.isFav = false,
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isFav': isFav,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'categoryValues': categoryValues.toJson()
    };
  }

  static EventDataModel fromJson(Map<String, dynamic> json) {
    return EventDataModel(
        categoryValues: CategoryValues.fromJson(json['categoryValues']),
        dateTime: DateTime.fromMillisecondsSinceEpoch(json['dateTime']),
        description: json['description'],
        isFav: json['isFav'],
        id: json['id'],
        title: json['title']);
  }
}
