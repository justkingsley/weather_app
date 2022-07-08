import 'package:flutter/material.dart';

class WeatherTile extends StatelessWidget {

  late IconData icon;
  String title;
  String subtitle;

  WeatherTile({Key? key, required this.icon, required this.title, required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.blue,),
        ],
      ),
      title: Text(title,
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            color: Colors.blueAccent
        ),
      ),
    );
  }
}
