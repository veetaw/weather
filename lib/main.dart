import 'package:flutter/material.dart';

import 'package:weather/homepage/homepage.dart';

void main() => runApp(WeatherApp());

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (RouteSettings route) {
        // TODO: handle unknown route
        switch (route.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => HomePage());
        }
      },
      initialRoute: '/',
      onGenerateTitle: (_) => 'Weather',
    );
  }
}
