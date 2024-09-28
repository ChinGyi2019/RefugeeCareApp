import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:refugee_care_mobile/feature/cards/my_cards_screen.dart';
import 'package:refugee_care_mobile/feature/cards/save/save_card_screen.dart';
import 'package:refugee_care_mobile/feature/directory/directory_screen.dart';
import 'package:refugee_care_mobile/feature/emergency/emergency_screen.dart';
import 'package:refugee_care_mobile/feature/home/home_screen.dart';
import 'package:refugee_care_mobile/main.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key, required this.title});
  static const String routeName = "/home";
  final String title;

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  final int _counter = 0;
  int _selectedIndex = 0;
  void _goToSaveScreen() {
    setState(() {
      MyApp.setLocale(context, const Locale('zu'));
      context.push(SaveCardScreen.routeName);
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        if (_selectedIndex == 0)
          const MyHomePage(title: '')
        else if (_selectedIndex == 2)
          const MyCardsPage(title: '')
        else if (_selectedIndex == 1)
          const EmergencyScreen(title: '')
        else
          const DirectoryScreen(title: '')
        // else
        //   const MyHomePage(title: '')
      ]),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emergency_outlined),
            label: 'Emergency',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card_outlined),
            label: 'Cards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions),
            label: 'Directory',
          ),
        ],
      ),

      floatingActionButton: _selectedIndex == 2
          ? FloatingActionButton(
              onPressed: _goToSaveScreen,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            )
          : null, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
