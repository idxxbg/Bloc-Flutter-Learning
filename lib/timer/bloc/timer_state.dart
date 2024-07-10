// gom co 4 trang thai cua timer
// 1, TimerInitial : san sang dem nguoc
// 2, TimerRuninprogress : dang trong qtrinh dem nguoc
// 3, TimerRunPause : Tam dung qua trinh tai tg con lai
// 4, TimerRunComplete : Thoi gian tro ve voi muc 0, muc hoan thanh

part of 'timer_bloc.dart';

sealed class TimerState {
  const TimerState(this.duration);
  final int duration;

  @override
  List<Object> get props => [duration];
}

final class TimerInitial extends TimerState {
  const TimerInitial(super.duration);

  @override
  String toString() => 'TimeInital {duration: $duration}';
}

final class TimerRunInprogress extends TimerState {
  const TimerRunInprogress(super.duration);
  @override
  String toString() => 'TimerRunInprogress {duration: $duration}';
}

final class TimerRunPause extends TimerState {
  const TimerRunPause(super.duration);
  @override
  String toString() => 'TimerRunPause {duration: $duration}';
}

final class TimerRunComplete extends TimerState {
  const TimerRunComplete() : super(0);
}
