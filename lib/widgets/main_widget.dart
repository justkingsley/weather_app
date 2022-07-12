import 'package:flutter/material.dart';
import 'package:weather_app/widgets/weather_tile.dart';

class MainWidget extends StatelessWidget {
  final location;
  final temp;
  final tempMin;
  final tempMax;
  final weather;
  final humidity;
  final windSpeed;

  MainWidget({Key? key, this.location, this.temp, this.tempMin, this.tempMax, this.weather, this.humidity, this.windSpeed}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://thumbs.gfycat.com/AromaticCharmingHamadryas-size_restricted.gif'),
              fit: BoxFit.cover,
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(location,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2.0,
                  color: Colors.white,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text('$temp°C',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 52.0,
                    fontWeight: FontWeight.w600,
                  ),),
              ),
              Text('high of $tempMax°C,  low of $tempMin°C',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                ),
              )
            ],
          ),
        ),
        Expanded(

            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  WeatherTile(icon: Icons.thermostat_sharp, title: 'Temperature', subtitle: '$temp°C'),
                  WeatherTile(icon: Icons.filter_drama_outlined, title: "Weather", subtitle: '$weather'),
                  WeatherTile(icon: Icons.wb_sunny_outlined, title: 'Humidity', subtitle: '$humidity°C'),
                  WeatherTile(icon: Icons.waves_outlined, title: 'Wind Speed', subtitle: '${windSpeed}kph')
                ],
              ),
            )
        )
      ],
    );
  }
}
