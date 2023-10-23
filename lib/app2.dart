import 'dart:async';

import 'package:flutter/material.dart';

class App2 extends StatefulWidget {
  const App2({super.key});

  @override
  State<App2> createState() => _App2State();
}

class _App2State extends State<App2> {
  late StreamSubscription subscription;

  @override
  void initState() {
    controllerStream();
    super.initState();
  }

  controllerStream() {
    StreamController<int> controller = StreamController<int>();

    StreamSubscription tempSubscription = controller.stream.listen((int value) {
      debugPrint('Value From Controller: $value');
    });

    setState(() {
      subscription = tempSubscription;
    });

    startStreamController(controller, 30);
  }

  void startStreamController(StreamController<int> controller, int n) async {
    int k = 0;
    while (k < n) {
      await Future.delayed(const Duration(milliseconds: 1000));
      controller.add(k++);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          subscription.cancel();
        }),
      ),
    );
  }
}
