import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:weather/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        WeatherFactory wf = WeatherFactory(
          "21fb559cf938953ee8b882bd2164ec99",
          language: Language.VIETNAMESE,
        );
        Weather weather = await wf.currentWeatherByLocation(
          event.position.latitude,
          event.position.longitude,
        );
        print(weather);
        emit(WeatherSuccess(weather));
      } catch (e) {
        emit(WeatherFailure());
      }
    });
  }
}
