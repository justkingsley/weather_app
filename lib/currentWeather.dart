import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import 'package:http/http.dart' as http;

class CurrentWeather extends StatefulWidget {
  const CurrentWeather({Key? key}) : super(key: key);

  @override
  State<CurrentWeather> createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('My Weather App'),
      )
    );
  }

  //Weather column

  Column weatherBox(Weather weather){
    return Column(
      children: [
        Text("${weather.temp}°C"),
        Text('${weather.description}'),
        Text('Feels: ${weather.feelsLike}°C'),
        Text('H:${weather.high}°C L:${weather.low}°C')
      ],
    );
  }

  //Getting Current Weather

  Future getCurrentWeather() async {
    Weather weather;
    String city = 'harare';
    String apiKey = '86b1d41fc2846fb077f5a17ea723805b';
    var url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?id=$city&appid=$apiKey";

    var response = await http.get(url);

    if(response.statusCode == 200){
      weather = Weather.fromJson(jsonDecode(response.body));
    }else{
      // todo: add esle condition
    }
  }

}
