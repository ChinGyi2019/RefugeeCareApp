import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:refugee_care_mobile/feature/cards/my_cards_screen.dart';
import 'package:refugee_care_mobile/feature/home/home_screen.dart';
import 'package:refugee_care_mobile/responsive.dart';
import 'package:refugee_care_mobile/shared/constants/Default.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key, required this.title});

  final String title;

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  int _counter = 0;
  int _selectedIndex = 0;
  void _incrementCounter() {
    setState(() {
      context.push("/my-cards");
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
      body: Expanded(
        flex: 1,
        child: Column(children: [
          if (_selectedIndex == 0)
            const MyHomePage(title: '')
          else if (_selectedIndex == 2)
            const MyCardsPage(title: '')
          // else if (_selectedIndex == 1)
          //   const MyCardsPage(title: '')
          // else
          //   const MyHomePage(title: '')
        ]),
      ),
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
            icon: Icon(Icons.notifications),
            label: 'Updates',
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
