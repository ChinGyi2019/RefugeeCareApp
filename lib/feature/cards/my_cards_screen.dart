import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';

class MyCardsPage extends StatefulWidget {
  const MyCardsPage({super.key, required this.title});

  final String title;

  @override
  State<MyCardsPage> createState() => _MyCardsScreenState();
}

class _MyCardsScreenState extends State<MyCardsPage> {
  int _counter = 0;
  int _selectedIndex = 0;
  void _incrementCounter() {
    setState(() {
      //  _counter++;
      context.pop();
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).colorScheme.surface,
        child: Column(children: [
          AppBar(
            elevation: 0,
            toolbarHeight: Theme.of(context).appBarTheme.toolbarHeight,
            shadowColor: null,

            centerTitle: false,
            backgroundColor: AppColors.primaryLight,
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text(
              'My Cards',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                  fontSize: 20),
            ),
          )
        ]));
  }
}
