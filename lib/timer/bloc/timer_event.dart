// TimerStarted: thông báo cho TimeBloc rằng bộ đếm thời gian sẽ được bắt đầu.
// TimerPaused: thông báo cho TimeBloc rằng bộ hẹn giờ sẽ bị tạm dừng.
// TimerResumed: thông báo cho TimeBloc rằng bộ hẹn giờ sẽ được tiếp tục.
// TimerReset: thông báo cho TimeBloc rằng bộ hẹn giờ phải được đặt lại về trạng thái ban đầu.
// _TimerTicked: thông báo cho TimeBloc rằng một đánh dấu đã xảy ra và nó cần cập nhật trạng thái tương ứng.

part of 'timer_bloc.dart';

abstract class TimerEvent {
  const TimerEvent();
}

final class TimerStarted extends TimerEvent {
  const TimerStarted({required this.duration});
  final int duration;
}

final class TimerPaused extends TimerEvent {
  const TimerPaused();
}

final class TimerResumed extends TimerEvent {
  const TimerResumed();
}

final class TimerReset extends TimerEvent {
  const TimerReset();
}

final class _TimerTicked extends TimerEvent {
  const _TimerTicked({required this.duration});
  final int duration;
}
