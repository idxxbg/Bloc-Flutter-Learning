import 'package:auto_size_text/auto_size_text.dart';
import 'package:bloc_flutter_learning/counter_bloc/counter_bloc.dart';
import 'package:bloc_flutter_learning/counter_bloc/counter_event.dart';
import 'package:bloc_flutter_learning/counter_bloc/counter_state.dart';
import 'package:bloc_flutter_learning/widget/back_ground.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:glass/glass.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      extendBodyBehindAppBar: true,
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
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        ),
        title: const AutoSizeText(
          'Counter Bloc State View',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w900,
            color: Colors.black54,
          ),
        ),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (_, state) {
          return Stack(
            children: [
              const BackGround(),
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    '${state.count}',
                    style: const TextStyle(
                        color: Colors.white54,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                    selectionColor: Colors.white54,
                  ),
                ).asGlass(
                    clipBorderRadius: BorderRadius.circular(10),
                    tintColor: Colors.black38),
              ),
            ],
          );
        },
      ),
    );
  }
}
