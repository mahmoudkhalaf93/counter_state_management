import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';
import 'bloc/theme_bloc.dart';
import 'cubit/counter_cubit.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Add the Cubit and Blocs to the app using BlocProvider (Phase 1 & 3)
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(create: (_) => ThemeBloc()),
        BlocProvider<CounterCubit>(create: (_) => CounterCubit()),
        // CounterBloc included to fulfill Phase 1 requirements
        BlocProvider<CounterBloc>(create: (_) => CounterBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
            title: 'Flutter BLoC Counter',
            theme: theme,
            home: const HomeScreen(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
