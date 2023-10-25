abstract class CounterState {
  CounterState(this.counter);

  int counter;
}

class InitialCounterState extends CounterState {
  InitialCounterState() : super(10);
}

class AdjustedCounterState extends CounterState {
  AdjustedCounterState({required counter}) : super(counter);
}

class LoadingCounterState extends CounterState {
  LoadingCounterState({required counter}) : super(counter);
}
