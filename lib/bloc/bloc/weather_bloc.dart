import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/services/weather_service.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherFetchEvent>(weatherFetchEvent);
  }

  FutureOr<void> weatherFetchEvent(
      WeatherFetchEvent event, Emitter<WeatherState> emit) async {
    emit(WeatherLoadingState());
    Map<String, dynamic> weatherData = await WeatherService.getCurrentWeather();
  
    print("weather data:$weatherData");
    emit(WeatherFetchSuccessState(weather: weatherData));
  }
}
