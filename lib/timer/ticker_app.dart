import 'package:bloc_flutter_learning/timer/bloc/timer_bloc.dart';
import 'package:bloc_flutter_learning/timer/ticker.dart';
import 'package:bloc_flutter_learning/timer/view/timer_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TickerApp extends StatelessWidget {
  const TickerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerBloc(
        ticker: Ticker(),
      ),
      child: const TimerView(),
    );
  }
}
