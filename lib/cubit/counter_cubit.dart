import 'package:flutter_bloc/flutter_bloc.dart';

// CounterCubit with increment and decrement methods (Phase 3)
class CounterCubit extends Cubit<int> {
  // Initialize the cubit with a starting state of 0
  CounterCubit() : super(0);

  // Method to increment the state by 1
  void increment() => emit(state + 1);

  // Method to decrement the state by 1
  void decrement() => emit(state - 1);
}
