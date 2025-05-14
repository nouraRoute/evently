import 'package:evently/common/services/firebase_serices.dart';
import 'package:evently/home/tabs/home_tab/provider/home_tab_provider.dart';
import 'package:evently/home/tabs/home_tab/widgets/event_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventsListView extends StatelessWidget {
  const EventsListView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var selectedCategory = context.watch<HomeTabProvider>().selectedCategory;
    return Expanded(
      child: StreamBuilder(
        stream:
            FirebaseSerices.getAllEventsStream(categoryValue: selectedCategory),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            var data = snapshot.data ?? [];
            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: data.length,
              itemBuilder: (context, index) =>
                  EventCard(eventDataModel: data[index]),
            );
          }
        },
      ),
    );
  }
}
