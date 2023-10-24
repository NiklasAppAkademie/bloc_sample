import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() async {
    emit(state + 1);
    await Future.delayed(Duration(seconds: 3));
    emit(state + 1);
  }
}
