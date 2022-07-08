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
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Location',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text('Temp',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w900,
                    ),),
                  ),
                  Text('high of temp, low of temp',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
    );
  }
}
