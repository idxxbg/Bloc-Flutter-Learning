import 'package:bloc_flutter_learning/counter_bloc/counter_event.dart';
import 'package:bloc_flutter_learning/counter_bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<IncrementPressed>(
      (event, emit) => emit(
        CounterState(state.count + 1),
      ),
    );
    on<DecrementPressed>(
      (event, emit) => emit(
        CounterState(state.count - 1),
      ),
    );
  }
}
