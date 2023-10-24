import 'dart:async';

import 'package:flutter/material.dart';

class StreamSample1 extends StatefulWidget {
  const StreamSample1({super.key});

  @override
  State<StreamSample1> createState() => _StreamSample1State();
}

class _StreamSample1State extends State<StreamSample1> {
  @override
  void initState() {
    generatorStream();
    super.initState();
  }

  generatorStream() async {
    Stream<int> asyncGenerator = createAsyncGenerator(15);

    int sum = await sumStream(asyncGenerator);
    debugPrint("Das Ergebnis ist: $sum");
  }

  Stream<int> createAsyncGenerator(int n) async* {
    int k = 0;
    while (k < n) {
      await Future.delayed(const Duration(milliseconds: 1000));
      debugPrint("Die aktuelle Zahl ist: $k");
      yield k++;
    }
  }

  Future<int> sumStream(Stream<int> stream) async {
    int sum = 0;
    await for (int value in stream) {
      sum += value;
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
