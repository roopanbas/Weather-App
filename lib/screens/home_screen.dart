import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/bloc/weather_bloc.dart';
import 'package:weather_app/screens/splash_screen.dart';
import 'package:weather_app/utils/colors.dart';
import 'package:weather_app/widgets/additional_info_item.dart';
import 'package:weather_app/widgets/current_weather_card.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/widgets/wind_cloud_info_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherBloc weatherBloc = WeatherBloc();
    weatherBloc.add(WeatherFetchEvent());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<WeatherBloc, WeatherState>(
            bloc: weatherBloc,
            buildWhen: (previous, current) => current is! WeatherActionState,
            listenWhen: (previous, current) => current is WeatherActionState,
            builder: (context, state) {
              switch (state.runtimeType) {
                case WeatherLoadingState:
                  return const Center(
                    child: SplashScreen(),
                  );

                case WeatherErrorState:
                  return const Center(
                    child: Text("Something went wrong!!!"),
                  );

                case WeatherFetchSuccessState:
                  final data = state as WeatherFetchSuccessState;
                  final currentTemp = data.weather['main']['temp'] - 273.15;
                  final feelsLike = data.weather['main']['feels_like'] - 273.15;
                  final currentSky = data.weather['weather'][0]['description'];
                  final getCurrentSky = data.weather['weather'][0]['main'];
                  final wind = data.weather['wind']['speed'];
                  final windDirection = data.weather['wind']['deg'];
                  final humidity = data.weather['main']['humidity'];
                  final pressure = data.weather['main']['pressure'];
                  final visibility = data.weather['visibility'];
                  final clouds = data.weather['clouds']['all'];
                  final sunrise = DateTime.fromMillisecondsSinceEpoch(
                      data.weather['sys']['sunrise'] * 1000);
                  final sunset = DateTime.fromMillisecondsSinceEpoch(
                      data.weather['sys']['sunset'] * 1000);

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Weather App",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.010),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          title: Text("${data.weather['name']}"),
                          subtitle:
                              Text(DateFormat.yMMMEd().format(DateTime.now())),
                          titleTextStyle: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 26),
                          subtitleTextStyle:
                              const TextStyle(color: Colors.black),
                        ),
                      ),
                      CurrentWeatherCard(
                        currentTemp: currentTemp,
                        currentSky: currentSky,
                        feelsLike: feelsLike,
                        image: getWeatherImage(getCurrentSky),
                      ),
                      Container(
                        decoration: boxDecoration,
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            AdditionalInfoItem(
                                value: visibilityLabel(visibility),
                                icon: Icons.visibility,
                                label: "Visibility"),
                            AdditionalInfoItem(
                                value: humidity.toString(),
                                icon: Icons.water_drop,
                                label: "Humidity"),
                            AdditionalInfoItem(
                                value: pressure.toString(),
                                icon: Icons.adjust,
                                label: "Pressure")
                          ],
                        ),
                      ),
                      WindCloudInfoCard(
                          wind: wind,
                          angle: windDirection,
                          clouds: clouds,
                          sunrise: sunrise,
                          sunset: sunset),
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.010),
                    ],
                  );

                default:
                  return const Center(
                    child: Text("Something went wrong"),
                  );
              }
            },
            listener: (context, state) {}),
      ),
    );
  }

  String visibilityLabel(num visibility) {
    if (visibility > 10000) {
      return "Exceptional visibility";
    } else if (visibility > 4000 && visibility <= 10000) {
      return "Excellent";
    } else if (visibility > 1000 && visibility < 4000) {
      return "Good";
    } else if (visibility > 500 && visibility < 1000) {
      return "Moderate";
    } else {
      return "Low";
    }
  }

  String getWeatherImage(String currentSky) {
    if (currentSky == "Clouds") {
      return "https://lottie.host/116ed6c1-f4fc-48b9-8fe5-cdf3735fcee8/toUvpUGYUU.json";
    } else if (currentSky == "Rain") {
      return "https://lottie.host/2671f6a0-643d-4225-81f6-62e203a4b20f/wiX5TSRkkg.json";
    } else if (currentSky == "Thunderstorm") {
      return "https://lottie.host/253cfcc0-9d05-4f43-ae54-b4ef9c89c6ac/g4ay5KRFq5.json";
    } else {
      return "https://lottie.host/116ed6c1-f4fc-48b9-8fe5-cdf3735fcee8/toUvpUGYUU.json";
    }
  }

  String getWeatherMessage(String currentSky) {
    if (currentSky == "Clouds") {
      return "hi";
    } else if (currentSky == "Rain") {
      return "hoi";
    } else if (currentSky == "Thunderstorm") {
      return "hello";
    } else {
      return "c";
    }
  }

  showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container();
        });
  }
}
