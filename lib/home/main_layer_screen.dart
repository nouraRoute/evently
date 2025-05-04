import 'package:evently/home/tabs/home_tab/home_tab.dart';
import 'package:flutter/material.dart';

class MainLayerScreen extends StatefulWidget {
  const MainLayerScreen({super.key});
  static const String routeName = 'mainLayerScreen';
  @override
  State<MainLayerScreen> createState() => _MainLayerScreenState();
}

class _MainLayerScreenState extends State<MainLayerScreen> {
  List<Widget> tabs = [HomeTab(), Container(), Container(), Container()];
  int index = 0;
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
          onPressed: () {},
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
                  label: 'Home'), //TODO:localiztion
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.location_on),
                  icon: Icon(Icons.location_on_outlined),
                  label: 'Map'),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.favorite),
                  icon: Icon(Icons.favorite_border),
                  label: 'Love'),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.person),
                  icon: Icon(Icons.person_outline_rounded),
                  label: 'Profile'),
            ]),
      ),
    );
  }
}
