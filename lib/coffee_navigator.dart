import 'package:bottom_nav_bar/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeNavigator extends StatefulWidget {
  static final GlobalKey<NavigatorState> coffeeNavigatorKey =
      GlobalKey<NavigatorState>();

  const CoffeeNavigator({Key? key}) : super(key: key);

  @override
  State<CoffeeNavigator> createState() => _CoffeeNavigatorState();
}

class _CoffeeNavigatorState extends State<CoffeeNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: CoffeeNavigator.coffeeNavigatorKey,
      initialRoute: '/',
      onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) {
        switch (settings.name) {
          case '/':
            return const Coffee1();
          case '/coffee2':
            return const Coffee2();
          default:
            return const Coffee1();
        }
      }),
    );
  }
}
