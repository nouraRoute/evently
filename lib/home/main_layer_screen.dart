import 'package:evently/auth/provider/auth_provider.dart';
import 'package:evently/events/create_event_page.dart';
import 'package:evently/home/tabs/fav_events_tab/fav_events_tab.dart';
import 'package:evently/home/tabs/home_tab/home_tab.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainLayerScreen extends StatefulWidget {
  const MainLayerScreen({super.key});
  static const String routeName = 'mainLayerScreen';
  @override
  State<MainLayerScreen> createState() => _MainLayerScreenState();
}

class _MainLayerScreenState extends State<MainLayerScreen> {
  List<Widget> tabs = [HomeTab(), Container(), FavEventsTab(), Container()];
  int index = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (context.read<UserAuthProvider>().userModel == null &&
        FirebaseAuth.instance.currentUser != null) {
      context.read<UserAuthProvider>().getUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[index],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 5)),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(CreateEventPage.routeName);
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
          shape: CircleBorder(),
          backgroundColor: Theme.of(context).highlightColor,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 2,
        shape: const CircularNotchedRectangle(),
        color: Theme.of(context).highlightColor,
        padding: EdgeInsets.zero,
        child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            currentIndex: index,
            onTap: (value) {
              index = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.home),
                  icon: Icon(Icons.home_outlined),
                  label: AppLocalizations.of(context)!.home), //TODO:localiztion
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.location_on),
                  icon: Icon(Icons.location_on_outlined),
                  label: AppLocalizations.of(context)!.map),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.favorite),
                  icon: Icon(Icons.favorite_border),
                  label: AppLocalizations.of(context)!.love),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.person),
                  icon: Icon(Icons.person_outline_rounded),
                  label: AppLocalizations.of(context)!.profile),
            ]),
      ),
    );
  }
}
