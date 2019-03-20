import 'package:flutter/material.dart';
import 'package:flutter_weather/Res.dart';
import 'package:flutter_weather/model/weather_data_entity.dart';

class Weather extends StatelessWidget {
  final WeatherDataEntity data;

  Weather(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(data.cityinfo.city,
                style: TextStyle(
                    color: $Colors.blueParis,
                    fontSize: 21.0,
                    fontWeight: FontWeight.w700)),
            Text(data.data.forecast[0].type,
                style: TextStyle(color: $Colors.blueParis, fontSize: 18.0)),
            Text("${data.data.wendu}℃",
                style: TextStyle(
                    color: $Colors.blueParis,
                    fontSize: 72,
                    fontFamily: "Roboto")),
            Text(
              data.data.forecast[0].notice,
              style: TextStyle(color: $Colors.blueParis, fontSize: 18),
            )
          ],
        ));
  }
}
