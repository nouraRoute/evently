import 'package:evently/home/tabs/home_tab/widgets/event_card.dart';
import 'package:evently/models/event_data_model.dart';
import 'package:flutter/material.dart';

class EventsListView extends StatelessWidget {
  const EventsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: EventDataModel.dummyData.length,
      itemBuilder: (context, index) =>
          EventCard(eventDataModel: EventDataModel.dummyData[index]),
    ));
  }
}
