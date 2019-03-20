import 'package:flutter/material.dart';
import 'package:flutter_weather/DotPageIndicator.dart';
import 'package:flutter_weather/ForecastItem.dart';
import 'package:flutter_weather/Res.dart';
import 'package:flutter_weather/model/weather_data_entity.dart';

class ForecastPager extends StatefulWidget {
  final WeatherDataEntity data;

  ForecastPager(this.data);

  @override
  State<StatefulWidget> createState() {
    return ForecastPagerState();
  }
}

class ForecastPagerState extends State<ForecastPager> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black12))),
          child: Container(
            height: 40,
            child: Stack(
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      widget.data.data.forecast[currentPage].week,
                      style: TextStyle(fontSize: 20, color: $Colors.blueParis),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Text(
                      widget.data.data.forecast[currentPage].ymd,
                      style: TextStyle(fontSize: 20, color: $Colors.blueParis),
                    )
                  ],
                ),
                Align(
                    child: Container(
                      child: new DotPageIndicator(5, currentPage),
                    ),
                    alignment: Alignment.center)
              ],
            ),
          ),
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
        ),
        Expanded(
            child: PageView.builder(
          itemBuilder: (BuildContext context, int index) =>
              ForecastItem(widget.data.data.forecast[index]),
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          onPageChanged: (int page) => {
                setState(() {
                  currentPage = page;
                })
              },
        ))
      ],
    );
  }
}
