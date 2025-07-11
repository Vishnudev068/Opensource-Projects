class WeatherModel {
  late final String city;
  late final double temperature;
  late final String description;

  WeatherModel({
    required this.city,
    required this.temperature,
    required this.description,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      city: json['name'],
      temperature: json['main']['temp'].toDouble(),
      description: json['weather'][0]['description'],
    );
  }
}
