class Weather{
  late final double temp;
  late final double feelsLike;
  late final double low;
  late final double high;
  late final double description;

  Weather({required this.temp, required this.feelsLike, required this.low, required this.high, required this.description});

  factory Weather.fromJson(Map<String, dynamic> json){
    return Weather(
        temp: json['main']['temp'].toDouble,
        feelsLike: json['main']['feelsLike'].toDouble,
        low: json['main']['low'].toDouble,
        high: json['main']['high'],
        description: json['main']['description'].toDouble);
  }
}