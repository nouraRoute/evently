import 'package:evently/home/tabs/home_tab/views/events_list_view.dart';
import 'package:evently/home/tabs/home_tab/views/home_header.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [HomeHeader(), EventsListView()],
    );
  }
}
