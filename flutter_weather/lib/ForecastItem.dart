import 'package:flutter/material.dart';
import 'package:flutter_weather/Title.dart';
import 'package:flutter_weather/model/weather_data_entity.dart';

class ForecastItem extends StatelessWidget {
  final WeatherDataDataForecast data;

  ForecastItem(this.data);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 12),
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TitleText("天气:", data.type),
        TitleText("温度:", "${data.low} ${data.high}"),
        TitleText("日出:", data.sunrise),
        TitleText("日落:", data.sunset),
        TitleText("风力:", "${data.fx} ${data.fl}"),
        TitleText("提示:", data.notice)
      ],
    )));
  }
}
