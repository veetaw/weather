import 'package:flutter/material.dart';

import 'package:weather/homepage/homepage.dart';

void main() => runApp(WeatherApp());

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (RouteSettings route) {
        // TODO: handle unknown route
        switch(route.name) {
          case '/home':
            return MaterialPageRoute(builder: (_) => HomePage());
        }
      },
      routes: {
        '/home': (_) => HomePage(),
      },
      initialRoute: '/home',
      onGenerateTitle: (_) => 'Weather',
    );
  }
}
