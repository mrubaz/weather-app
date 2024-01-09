import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

import '../data/my_data.dart';

part 'weather_app_event.dart';
part 'weather_app_state.dart';

class WeatherBlocBloc extends Bloc<WeatherAppEvent, WeatherAppState> {
  WeatherBlocBloc() : super(WeatherBlocInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherAppLoading());
      try {
        WeatherFactory wf = WeatherFactory(API_KEY);

        Weather weather = await wf.currentWeatherByLocation(
          event.position.latitude,
          event.position.longitude,
        );

        emit(WeatherAppSuccess(weather));
      } catch (e) {
        emit(WeatherAppFailure(errorMessage: e.toString()));
      }
    });
  }
}
