import 'package:flutter/material.dart';

class Coffee1 extends StatelessWidget {
  const Coffee1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee1'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () async =>
                  await Navigator.pushNamed(context, '/coffee2'),
              child: const Text('Coffee2'))
        ],
      ),
    );
  }
}

class Coffee2 extends StatelessWidget {
  const Coffee2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee2'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Coffee1'))
        ],
      ),
    );
  }
}
