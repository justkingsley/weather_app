import 'package:flutter/material.dart';

class WeatherTile extends StatelessWidget {

  late IconData icon;
  String title;
  String subtitle;

  WeatherTile({Key? key, required this.icon, required this.title, required this.subtitle}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: const BoxDecoration(
            // border: Border.all(
            //   color: Colors.black38,
            // ),
            color: Color(0xFF462B9E),
            borderRadius: BorderRadius.all(Radius.circular(12))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 28,
            ),
          ],
        ),
      ),
      title: Text(title,
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
          color: Color(0xFF462B9E)
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            color: Color(0xFF9575FE)
        ),
      ),
    );
  }
}
