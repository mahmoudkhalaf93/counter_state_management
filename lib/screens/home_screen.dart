import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/counter_cubit.dart';
import '../bloc/theme_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CounterCubit, int>(
      // Phase 3: Use BlocListener to show a dialog when the counter reaches a negative value.
      listener: (context, state) {
        if (state < 0) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Negative Value'),
                content: const Text(
                  'The counter has reached a negative value.',
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter BLoC Counter'),
          actions: [
            IconButton(
              icon: const Icon(Icons.brightness_6),
              tooltip: 'Toggle Theme',
              onPressed: () {
                context.read<ThemeBloc>().add(ToggleThemeEvent());
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'BlocBuilder Example:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              // Phase 3: Use BlocBuilder to rebuild the UI when the state changes
              BlocBuilder<CounterCubit, int>(
                builder: (context, state) {
                  return Text(
                    'Builder Value: $state',
                    style: const TextStyle(fontSize: 24),
                  );
                },
              ),
              const SizedBox(height: 32),
              const Text(
                'BlocConsumer Example:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              // Phase 3: Use BlocConsumer to display the counter and show a message whenever the counter reaches 10 or -10.
              BlocConsumer<CounterCubit, int>(
                listener: (context, state) {
                  if (state == 10 || state == -10) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Counter reached $state!'),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return Text(
                    'Consumer Value: $state',
                    style: const TextStyle(fontSize: 24),
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () => context.read<CounterCubit>().increment(),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 16),
            FloatingActionButton(
              onPressed: () => context.read<CounterCubit>().decrement(),
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
