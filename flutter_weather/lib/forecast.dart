import 'package:flutter/material.dart';
import 'package:flutter_weather/forecast_pager.dart';
import 'package:flutter_weather/model/weather_data_entity.dart';

class Forecast extends StatelessWidget {
  final WeatherDataEntity data;

  Forecast(this.data);

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return Container();
    }
    return Container(
        color: Color(0xFFB0B1C5),
        child: Container(
          child: new ForecastPager(data),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, -5)
                )
              ]
          ),
        ));
  }
}
