part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

abstract class WeatherActionState extends WeatherState{}

final class WeatherInitial extends WeatherState {}

class WeatherFetchSuccessState extends WeatherState {
  final Map<String, dynamic> weather;
  WeatherFetchSuccessState({required this.weather});
}

class WeatherLoadingState extends WeatherState {}

class WeatherErrorState extends WeatherState {}
