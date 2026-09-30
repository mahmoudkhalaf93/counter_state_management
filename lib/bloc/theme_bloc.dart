import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Events for ThemeBloc
abstract class ThemeEvent {}

class ToggleThemeEvent extends ThemeEvent {}

// ThemeBloc to toggle between light and dark themes (Phase 1)
class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  ThemeBloc() : super(ThemeData.light()) {
    // Listens for ToggleThemeEvent and switches the current theme
    on<ToggleThemeEvent>((event, emit) {
      if (state.brightness == Brightness.light) {
        emit(ThemeData.dark()); // Switch to dark theme
      } else {
        emit(ThemeData.light()); // Switch back to light theme
      }
    });
  }
}
