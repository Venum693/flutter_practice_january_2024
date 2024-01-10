import 'package:flutter/material.dart';
import 'package:flutter_practice_january/WeatherApi.dart';
import 'package:flutter_practice_january/weather_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiServiceProvider = Provider<WeatherApi>((ref) => WeatherApi());

final weatherProvider = FutureProvider<Weather>((ref) async {
  final weatherApiService = ref.watch(apiServiceProvider);
  return weatherApiService.fetchWeather();
});



class WeatherDisplay extends StatefulWidget {
  const WeatherDisplay({super.key});

  @override
  State<WeatherDisplay> createState() => _WeatherDisplayState();
}

class _WeatherDisplayState extends State<WeatherDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riverpod'),
      ),
      body: Center(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final weatherAtYourPlace = ref.watch(weatherProvider);

            return weatherAtYourPlace.when(
                data: (weatherObject){
                  return Column(
                    children: [
                      Text('${weatherObject.resolvedAddress}')
                    ],
                  );
                },
              error: (error, stackTrace)  {
                  print(error);
                  return Text('Error: $error');
              },
                loading: () => CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
