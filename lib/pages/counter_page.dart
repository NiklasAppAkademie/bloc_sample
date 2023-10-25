import 'package:bloc_sample/bloc/counter_bloc.dart';
import 'package:bloc_sample/bloc/counter_cubit.dart';
import 'package:bloc_sample/bloc/counter_events.dart';
import 'package:bloc_sample/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterBloc, CounterState>(listener: (context, state) {
      debugPrint(state.toString());
    }, builder: (context, state) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<CounterBloc>().add(CounterIncrement());
          },
          child: const Icon(Icons.add),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: state is LoadingCounterState
                    ? const CircularProgressIndicator()
                    : Text(
                        "${state.counter}",
                        style: TextStyle(fontSize: state.counter.toDouble()),
                      )),
            MaterialButton(
              onPressed: () {
                context.read<CounterBloc>().add(CounterDecrement());
              },
              child: const Text("Decrement"),
            ),
            MaterialButton(
              onPressed: () {
                context.read<CounterBloc>().add(CounterReset());
              },
              child: const Text("Reset"),
            ),
            MaterialButton(
              onPressed: () {
                context.read<CounterBloc>().add(CounterSet(newCounter: 50));
              },
              child: const Text("Set 50"),
            ),
          ],
        ),
      );
    });
  }
}
