import 'package:bottom_nav_bar/books.dart';
import 'package:flutter/material.dart';

class BookNavigator extends StatefulWidget {
  static final GlobalKey<NavigatorState> bookNavigatorKey =
      GlobalKey<NavigatorState>();

  const BookNavigator({Key? key}) : super(key: key);

  @override
  State<BookNavigator> createState() => _BookNavigatorState();
}

class _BookNavigatorState extends State<BookNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: BookNavigator.bookNavigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            switch (settings.name) {
              case '/':
                return const Book1();
              case '/book2':
                return const Book2();
              default:
                return const Book1();
            }
          },
        );
      },
    );
  }
}
