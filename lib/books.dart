import 'package:flutter/material.dart';

class Book1 extends StatelessWidget {
  const Book1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book1'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () async =>
                  await Navigator.pushNamed(context, '/book2'),
              child: const Text('Book2'))
        ],
      ),
    );
  }
}

class Book2 extends StatelessWidget {
  const Book2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book2'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () async => Navigator.pop(context),
              child: const Text('Book1'))
        ],
      ),
    );
  }
}
