import 'package:flutter/material.dart';

import 'Res.dart';
import 'TemperatureTrend.dart';
import 'WeatherTrendContainer.dart';
import 'model/weather_data_entity.dart';

class WeatherTrendPage extends StatelessWidget {
  final WeatherDataEntity data;

  WeatherTrendPage(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Container(
            width: double.infinity,
            child: Stack(
              children: <Widget>[
                Align(
                  child: Text("天气走势"),
                  alignment: Alignment.center,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                )
              ],
            ),
          ),
          backgroundColor: $Colors.blueParis,
        ),
        body: WeatherTrendContainer(Column(children: <Widget>[
          Padding(child: Row(
            children: <Widget>[
              Expanded(
                  child: Text(
                    "今天",
                    textAlign: TextAlign.center,
                  )),
              Expanded(child: Text("明天", textAlign: TextAlign.center)),
              Expanded(child: Text("后天", textAlign: TextAlign.center)),
              Expanded(
                  child: Text(data.data.forecast[3].week,
                      textAlign: TextAlign.center)),
              Expanded(
                  child: Text(data.data.forecast[4].week,
                      textAlign: TextAlign.center))
            ],
          ),padding: EdgeInsets.only(top: 10,bottom: 10),),
          Row(
            children: <Widget>[
              Expanded(
                  child: Text(
                    _convertTime(data.data.forecast[0].ymd),
                    textAlign: TextAlign.center,
                  )),
              Expanded(child: Text( _convertTime(data.data.forecast[1].ymd), textAlign: TextAlign.center)),
              Expanded(child: Text( _convertTime(data.data.forecast[2].ymd), textAlign: TextAlign.center)),
              Expanded(
                  child: Text( _convertTime(data.data.forecast[3].ymd),
                      textAlign: TextAlign.center)),
              Expanded(
                  child: Text( _convertTime(data.data.forecast[4].ymd),
                      textAlign: TextAlign.center))
            ],
          ),
          Padding(child: Row(
            children: <Widget>[
              Expanded(
                  child: Text(
                    data.data.forecast[0].type,
                    textAlign: TextAlign.center,
                  )),
              Expanded(child: Text( data.data.forecast[1].type, textAlign: TextAlign.center)),
              Expanded(child: Text( data.data.forecast[2].type, textAlign: TextAlign.center)),
              Expanded(
                  child: Text( data.data.forecast[3].type,
                      textAlign: TextAlign.center)),
              Expanded(
                  child: Text( data.data.forecast[4].type,
                      textAlign: TextAlign.center))
            ],
          ),padding:EdgeInsets.only(top: 10,bottom: 10),),
          Container(child: TemperatureTrend(data),width: double.infinity,height: 150,margin: EdgeInsets.only(top: 15),)
        ],))
        );
  }
}

String _convertTime(String date){
 final dateTime =  DateTime.parse(date);
 return "${dateTime.month}-${dateTime.day}";
}
