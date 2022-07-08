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

  const MainWidget({Key? key, this.location, this.temp, this.tempMin, this.tempMax, this.weather, this.humidity, this.windSpeed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(location.toString(),
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2.0,
                  color: Colors.white,
                ),
              ),
              Text('Time',
                style: TextStyle(
                  color: Colors.white,
                ),),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text('${temp.toString()}°C',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 52.0,
                    fontWeight: FontWeight.w900,
                  ),),
              ),
              Text('high of ${tempMax.toString()}°C,  low of ${tempMin.toString()}°C',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                ),
              )
            ],
          ),
        ),
        Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  WeatherTile(icon: Icons.device_thermostat_outlined, title: 'Temperature', subtitle: '${temp.toString()}°C'),
                  WeatherTile(icon: Icons.filter_drama_outlined, title: "Weather", subtitle: weather.toString()),
                  WeatherTile(icon: Icons.wb_sunny_outlined, title: 'Humidity', subtitle: '${humidity.toString()}°C'),
                  WeatherTile(icon: Icons.waves_outlined, title: 'Wind Speed', subtitle: '${windSpeed.toString()}kph')
                ],
              ),
            )
        )
      ],
    );
  }
}
