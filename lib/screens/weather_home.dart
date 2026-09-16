import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;  //imports the http package to send requests to web apis and recive data
import '../widgets/search_bar_widget.dart';
import '../widgets/current_weather_widget.dart';
import '../widgets/forecast_list_widget.dart';

class WeatherHome extends StatefulWidget { //statefulwidget: its ui can change when data changes
  const WeatherHome({super.key});

  @override
  State<WeatherHome> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  final TextEditingController _controller = TextEditingController();
  bool loading = false;
  String error = '';
  Map<String, dynamic>? weatherData;  //stores weather data as a key-value map, ?: means it can initially be null
  String cityName = '';
  String country = '';

  Future<void> fetchWeather(String city) async {
    setState(() {
      loading = true;
      error = '';
    });

    try {  //executes the codes which may produce error in the application
      final geoUrl = Uri.parse('https://geocoding-api.open-meteo.com/v1/search?name=$city');
      final geoResponse = await http.get(geoUrl);
      final geoData = jsonDecode(geoResponse.body);

      if (geoData['results'] == null || geoData['results'].isEmpty) {  //checks whether the api can find any no matching city
        setState(() {
          error = 'City not found. Please try another name.';
          weatherData = null;  //clears earlier displayed weather data
          loading = false;
        });
        return;
      }

      final result = geoData['results'][0];
      final lat = result['latitude'];
      final lon = result['longitude'];
      final name = result['name'];
      final countryName = result['country'];

      final weatherUrl = Uri.parse(
          'https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&current=temperature_2m,relative_humidity_2m,apparent_temperature,precipitation,weather_code,wind_speed_10m&daily=weather_code,temperature_2m_max,temperature_2m_min,precipitation_probability_max&forecast_days=7&timezone=auto');
      final weatherResponse = await http.get(weatherUrl);  //sends the weather api request and waits for its response
      final weatherResult = jsonDecode(weatherResponse.body);  //converts the weather apis json response into dart data that the app can use

      setState(() {
        weatherData = weatherResult;
        cityName = name;
        country = countryName;
        loading = false;
      });
    } 
    catch (e) {
      setState(() {
        error = 'Something went wrong. Please check your connection.';
        weatherData = null;
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWeather('Ghaziabad');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E2F),
      appBar: AppBar(
        title: const Text('Weather App'),
        backgroundColor: const Color(0xFF2A2A40),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width < 400 ? 10.0 : 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchBarWidget(
                controller: _controller,
                onSearch: () {
                  if (_controller.text.trim().isNotEmpty) {
                    fetchWeather(_controller.text.trim());
                  }
                },
              ),
              const SizedBox(height: 16),
              if (loading) const CircularProgressIndicator(color: Colors.white),
              if (error.isNotEmpty)
                Text(error, style: const TextStyle(color: Colors.redAccent)),
              if (weatherData != null) ...[
                CurrentWeatherWidget(
                  weatherData: weatherData!,
                  cityName: cityName,
                  country: country,
                ),
                ForecastListWidget(daily: weatherData!['daily']),
              ],
            ],
          ),
        ),
      ),
    );
  }
}