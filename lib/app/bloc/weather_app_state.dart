part of 'weather_app_bloc.dart';

sealed class WeatherAppState extends Equatable {
  const WeatherAppState();

  @override
  List<Object> get props => [];
}

final class WeatherBlocInitial extends WeatherAppState {}

final class WeatherAppLoading extends WeatherAppState {}

final class WeatherAppFailure extends WeatherAppState {
  final String errorMessage;

  const WeatherAppFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class WeatherAppSuccess extends WeatherAppState {
  final Weather weather;

  const WeatherAppSuccess(this.weather);

  @override
  List<Object> get props => [weather];
}
