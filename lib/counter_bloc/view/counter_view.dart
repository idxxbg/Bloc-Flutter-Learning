import 'package:bloc_flutter_learning/counter_bloc/counter_bloc.dart';
import 'package:bloc_flutter_learning/counter_bloc/counter_event.dart';
import 'package:bloc_flutter_learning/counter_bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: () {
              context.read<CounterBloc>().add(IncrementPressed());
            },
            child: const Icon(Icons.add),
          ),
          const Gap(10),
          FloatingActionButton(
            heroTag: 'dercrement',
            onPressed: () {
              context.read<CounterBloc>().add(DecrementPressed());
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        title: const Text(
          'Counter Bloc State View',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
            color: Colors.black54,
          ),
        ),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (_, state) {
          return Center(
            child: Text(
              '${state.count}',
              style: textTheme.displayLarge,
              selectionColor: Colors.black54,
            ),
          );
        },
      ),
    );
  }
}
