abstract class CounterEvent {
  const CounterEvent();
}

class IncrementPressed extends CounterEvent {}

class DecrementPressed extends CounterEvent {}
