import 'package:bottom_nav_bar/book_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'coffee_navigator.dart';
import 'book_navigator.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    BookNavigator.bookNavigatorKey,
    CoffeeNavigator.coffeeNavigatorKey,
  ];
  Future<bool> _systemBackButtonPressed() async {
    if (_navigatorKeys[_currentIndex].currentState!.canPop()) {
      _navigatorKeys[_currentIndex]
          .currentState!
          .pop(_navigatorKeys[_currentIndex].currentContext);
    } else {
      if (_currentIndex != 0) {
        setState(() {
          _currentIndex = 0;
        });
      } else {
        await SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _systemBackButtonPressed,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Book'),
            BottomNavigationBarItem(icon: Icon(Icons.coffee), label: 'Coffe'),
          ],
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() => _currentIndex = index);
          },
        ),
        body: SafeArea(
          child: IndexedStack(
            index: _currentIndex,
            children: const [
              BookNavigator(),
              CoffeeNavigator(),
            ],
          ),
        ),
      ),
    );
  }
}
