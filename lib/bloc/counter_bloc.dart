import 'package:flutter_bloc/flutter_bloc.dart';

// Events for CounterBloc
abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}

// CounterBloc to handle integer values (Phase 1)
class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    // Listens for IncrementEvent and adds 1 to the current state
    on<IncrementEvent>((event, emit) => emit(state + 1));
    // Listens for DecrementEvent and subtracts 1 from the current state
    on<DecrementEvent>((event, emit) => emit(state - 1));
  }
}
