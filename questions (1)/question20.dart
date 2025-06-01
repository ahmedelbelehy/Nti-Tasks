class WeatherReading {
  String location;
  int temperatureCelsius;
  int humidityPercent;
  String condition;

  WeatherReading(
      this.location, this.temperatureCelsius, this.humidityPercent, this.condition) {
  }

  void show() {
    print(location);
    print('$temperatureCelsius');

    if (condition == 'rainy') {
      print('get an umbrella');
    }
  }
}

void main() {
  WeatherReading reading = WeatherReading('el reaad', 35, 20, 'sunny');
  reading.show();
}
