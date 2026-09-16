# Weather App (Flutter)

A weather application built with Flutter that lets users search for any city and view its current weather along with a 7-day forecast.

## Features

- Search weather by city name
- Displays current temperature, feels-like temperature, humidity, wind speed, and weather condition
- 7-day forecast with min/max temperature and rain probability
- Loading and error states (invalid city, network failure)
- Default city shown on app launch

## API Used

- [Open-Meteo Geocoding API](https://open-meteo.com/en/docs/geocoding-api) — converts city name to coordinates
- [Open-Meteo Weather Forecast API](https://open-meteo.com/en/docs) — fetches current weather and 7-day forecast

No API key is required for either service.

## Tech Stack

- Flutter
- Dart
- `http` package for API calls

## Project Structure
lib/
├── main.dart
├── screens/
│ └── weather_home.dart
├── widgets/
│ ├── search_bar_widget.dart
│ ├── current_weather_widget.dart
│ └── forecast_list_widget.dart
└── utils/
└── weather_code_map.dart

## Author

Janhvi Gupta