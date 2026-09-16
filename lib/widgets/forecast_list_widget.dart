import 'package:flutter/material.dart';

import '../utils/weather_code_map.dart';

class ForecastListWidget extends StatelessWidget {
  final Map<String, dynamic> daily;

  const ForecastListWidget({super.key, required this.daily});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth < 400 ? 110.0 : 130.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const Text(
          '7-Day Forecast',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 170,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: daily['time'].length,
            itemBuilder: (context, index) {
              return Container(
                width: cardWidth,
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF2A2A40),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      daily['time'][index],
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      weatherCodeMap[daily['weather_code'][index]] ?? '',
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Max: ${daily['temperature_2m_max'][index]}°C',
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Min: ${daily['temperature_2m_min'][index]}°C',
                      style: const TextStyle(color: Colors.white70),
                    ),
                    Text(
                      'Rain: ${daily['precipitation_probability_max'][index]}%',
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
