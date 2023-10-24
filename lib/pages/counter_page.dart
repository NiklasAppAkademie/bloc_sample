import 'package:bloc_sample/bloc/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, int>(listener: (context, state) {
      debugPrint(state.toString());
    }, builder: (context, state) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<CounterCubit>().increment();
          },
          child: const Icon(Icons.add),
        ),
        body: Center(
            child: Text(
          "$state",
          style: const TextStyle(fontSize: 30),
        )),
      );
    });
  }
}
