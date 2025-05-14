import 'package:evently/common/services/firebase_serices.dart';
import 'package:evently/home/tabs/home_tab/widgets/event_card.dart';
import 'package:flutter/material.dart';

class FavEventsTab extends StatelessWidget {
  const FavEventsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          StreamBuilder(
            stream: FirebaseSerices.getFavEvents(),
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
                return Expanded(
                    child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: data.length,
                  itemBuilder: (context, index) =>
                      EventCard(eventDataModel: data[index]),
                ));
              }
            },
          ),
        ],
      ),
    );
  }
}
