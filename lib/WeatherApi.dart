
import 'package:flutter_practice_january/weather_model.dart';
import 'package:dio/dio.dart';

class WeatherApi{

  final Dio _dio = Dio();

  Future<Weather> fetchWeather() async {
    try {
      final response = await _dio.get(
        'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/38.9697,-77.385?key=UE6YCZ9APHQ7KFXKBQPDDP8DW',
      );

      if (response.statusCode == 200) {
        // Assuming your API response is in the expected format
        final data = response.data;

        return Weather.fromJson(data);
      } else {
        throw Exception('Failed to load user data');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }

    //return Weather.fromJson(response);
}
}