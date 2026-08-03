# MAUSAM : A Flutter Weather App

A simple Flutter app that fetches weather data from the OpenWeatherMap API. The app demonstrates basic API integration, navigation between screens, and handling of error responses for invalid city names.

## Features

- **Search by City:** Enter a city name to fetch its current weather.
- **API Integration:** Uses the OpenWeatherMap API to fetch weather data.
- **Error Handling:** Displays user-friendly error messages when the city is not found.
- **Loading Screen:** Shows a loading animation while data is being fetched.
- **Responsive UI:** Supports both vertical and horizontal scrolling (using `SingleChildScrollView`).

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- A valid [OpenWeatherMap API key](https://openweathermap.org/api)

### Installation

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/your-username/flutter-weather-app.git
   cd flutter-weather-app
   
2. **Install Dependencies:**
    ```bash
    flutter pub get

3. **Configure the API Key:**
- Open the file worker.dart located in the lib/Worker/ directory and replace YOUR_API_KEY with your actual API key:

## Project Structure

- **lib/main.dart:**  
  Entry point of the app. Sets up the initial routes and navigation.

- **lib/Activity/loading.dart:**  
  Contains the loading screen logic and handles API calls through the worker class.

- **lib/Activity/home.dart:**  
  Displays the weather information. Handles error display when the API returns an error response.

- **lib/Worker/worker.dart:**  
  Contains the logic for fetching weather data from the OpenWeatherMap API, along with error handling.

- **images/:**  
  Contains assets like the app logo.

## Acknowledgements

- [OpenWeatherMap](https://openweathermap.org/) for providing the weather API.
- [Flutter](https://flutter.dev/) for the amazing framework.
- [flutter_spinkit](https://pub.dev/packages/flutter_spinkit) for the loading animations.
- YAML for configuration management.



