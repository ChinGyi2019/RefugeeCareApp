import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      context.go("/my-cards");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        // Center is a layout widget. It takes a single child and positions it
        child: Stack(
      children: [
        Container(
            color: AppColors.primaryLight,
            width: double.infinity,
            child: const SizedBox(
              height: 250,
            )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            AppBar(
                elevation: 0,
                shadowColor: null,
                backgroundColor: Colors.transparent,
                // Here we take the value from the MyHomePage object that was created by
                // the App.build method, and use it to set our appbar title.
                title: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {},
                              color: Theme.of(context).primaryColor,
                              icon: const Icon(
                                Icons.person,
                                size: 32.0,
                              )),
                          IconButton(
                              onPressed: () {},
                              color: Theme.of(context).primaryColor,
                              icon: const Icon(
                                Icons.notifications,
                                size: 32.0,
                              )),
                        ])
                  ],
                )),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'We are here\nforyou',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).primaryColor,
                                fontSize: 24),
                      ),
                      Text(
                        '$_counter',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ]))
          ],
        ),
      ],
    ));
  }
}
