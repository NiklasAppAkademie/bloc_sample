import 'package:bloc_sample/bloc/counter_events.dart';
import 'package:bloc_sample/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(InitialCounterState()) {
    on<CounterIncrement>((event, emit) {
      emit(AdjustedCounterState(counter: state.counter + 1));
    });
    on<CounterDecrement>((event, emit) {
      emit(AdjustedCounterState(counter: state.counter - 1));
    });
    on<CounterReset>((event, emit) async {
      emit(LoadingCounterState(counter: state.counter));
      await Future.delayed(Duration(seconds: 3));
      emit(InitialCounterState());
    });
    on<CounterSet>((event, emit) async {
      emit(LoadingCounterState(counter: state.counter));
      await Future.delayed(Duration(seconds: 3));
      emit(AdjustedCounterState(counter: event.newCounter));
    });
  }
}
