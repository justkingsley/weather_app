import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/widgets/main_widget.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<WeatherInfo> fetchWeather () async {
  const city = "Harare";
  const apiKey = '';
  const requestUrl = "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric";

  final response = await http.get(Uri.parse(requestUrl));

  if(response.statusCode == 200){
    return WeatherInfo.fromJson(jsonDecode(response.body));
  }else{
    throw Exception('Error fetching weather data');
  }
}
class WeatherInfo{
  dynamic location;
  dynamic temp;
  dynamic tempMin;
  dynamic tempMax;
  dynamic weather;
  dynamic humidity;
  dynamic windSpeed;

  WeatherInfo({
    required this.location,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.weather,
    required this.humidity,
    required this.windSpeed
  });

  factory WeatherInfo.fromJson(Map<String, dynamic> json){
    return WeatherInfo(
      location: json['name'].toString(),
      temp: json['main']['temp'].toString(),
      tempMin: json['main']['temp_min'].toString(),
      tempMax: json['main']['temp_max'].toString(),
      weather: json['weather'][0]['description'].toString(),
      humidity: json['main']['humidity'].toString(),
      windSpeed: json['wind']['speed'].toString()

    );
  }
}

void main() => runApp(
      const MaterialApp(
        title: "Weather App",
        home: MyApp()
      )
);

class MyApp extends StatefulWidget{
  const MyApp({Key? key}) : super(key: key);


  @override
  State<StatefulWidget> createState () {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {

  late Future<WeatherInfo> futureWeather;

  @override
  void initState(){
    super.initState();
    futureWeather = fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFE4DFFD),
        body: FutureBuilder<WeatherInfo>(
          future: futureWeather,
          builder: (BuildContext context, snapshot) {
            if(snapshot.hasData){
              return MainWidget(
                location: snapshot.data!.location,
                temp: snapshot.data!.temp,
                tempMin: snapshot.data!.tempMin,
                tempMax: snapshot.data!.tempMax,
                weather: snapshot.data!.weather,
                humidity: snapshot.data!.humidity,
                windSpeed: snapshot.data!.windSpeed,
              );
            } else if(snapshot.hasError){
              return Center(
                child: Text('${snapshot.error}'),
              );
            }else{
              return const Center(
                  child: SpinKitDualRing(
                    color: Colors.blue,
                    size: 50.0,
                  ),);
            }
          }
        )
    );
  }
}
