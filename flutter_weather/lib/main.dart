import 'package:flutter/material.dart';
import 'package:flutter_weather/ChooseCityPage.dart';
import 'package:flutter_weather/ChooseCityPage2.dart';
import 'package:flutter_weather/HistoryManager.dart';
import 'package:flutter_weather/home.dart';

import 'WeatherTrendPage.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    HistoryManager.getInstance().initHistoryData();
    return MaterialApp(
      title: '天气预报',
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == "/router/choose_province") {
          return MaterialPageRoute(
               builder: (_) => new ChooseCityPage());
        } else if (settings.name == "/router/choose_city") {
          return MaterialPageRoute(
              builder: (_) => new ChooseCityPage2(settings.arguments));
        } else if(settings.name == "/router/weather_trend"){
          return MaterialPageRoute(builder:(_){
              return new WeatherTrendPage(settings.arguments);
          });
        }
      },
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
