import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        title: "Weather App",
        home: MyApp()
      )
);

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
