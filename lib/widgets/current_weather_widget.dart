import 'package:flutter/material.dart';
import '../utils/weather_code_map.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final Map<String, dynamic> weatherData;
  final String cityName;
  final String country;

  const CurrentWeatherWidget({
    super.key,
    required this.weatherData,
    required this.cityName,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    final current = weatherData['current'];
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A40),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$cityName, $country',
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 6),
          Text(weatherCodeMap[current['weather_code']] ?? '',
              style: const TextStyle(color: Colors.white70)),
          const SizedBox(height: 6),
          Text('Temperature: ${current['temperature_2m']}°C',
              style: const TextStyle(color: Colors.white, fontSize: 16)),
          Text('Feels like: ${current['apparent_temperature']}°C',
              style: const TextStyle(color: Colors.white70)),
          Text('Humidity: ${current['relative_humidity_2m']}%',
              style: const TextStyle(color: Colors.white70)),
          Text('Wind: ${current['wind_speed_10m']} km/h',
              style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}