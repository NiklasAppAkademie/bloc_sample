import 'dart:async';

import 'package:flutter/material.dart';

class StreamSample2 extends StatefulWidget {
  const StreamSample2({super.key});

  @override
  State<StreamSample2> createState() => _StreamSample2State();
}

class _StreamSample2State extends State<StreamSample2> {
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
