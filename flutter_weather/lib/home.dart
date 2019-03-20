import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_weather/ApiClient.dart';
import 'package:flutter_weather/HistoryManager.dart';
import 'package:flutter_weather/LocationClient.dart';
import 'package:flutter_weather/Res.dart';
import 'package:flutter_weather/ToolBar.dart';
import 'package:flutter_weather/Weather.dart';
import 'package:flutter_weather/forecast.dart';
import 'package:flutter_weather/model/CityList.dart';
import 'package:flutter_weather/model/city_entity.dart';
import 'package:flutter_weather/model/weather_data_entity.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  WeatherDataEntity data = null;
  String address;

  @override
  void initState() {
    super.initState();
    LocationClient.getInstance().getCurrentCity().then((value) {
      if (value != null) {
        ApiClient.getBaiduLocation(value["lat"], value["long"]).then((value) {
          print("city:${value.result.formattedAddress}");
          address = value.result.formattedAddress;
          final city = value.result.addresscomponent.city;
          if (city == "" || city == null) {
            address = "获取当前位置失败";
          } else {
            getCurrentLocationWeather(city);
          }
        });
      }
    });
  }

  getCurrentLocationWeather(String city) {
    final result =
        DefaultAssetBundle.of(context).loadString("assets/data/city.json");
    result.then((value) {
      List<dynamic> data = json.decode(value);
      final cityList = CityList.fromJson(data);
      for (CityEntity cityEntity in cityList.data) {
        if (city.replaceAll("市", "") == cityEntity.cityName) {
          ApiClient.getWeatherData(cityCode: cityEntity.cityCode)
              .then((weather) {
            this.data = weather;
            setState(() {});
          });
          break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFB0B1C5),
          child: new Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new AspectRatio(
              aspectRatio: 750.0 / 805.0,
              child: Stack(
                children: <Widget>[
                  Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: $Colors.blueParis,
                      child: Image.asset(
                        "assets/img/parisback.png",
                        fit: BoxFit.cover,
                      )),
                  getWeatherWidget(),
                  ToolBar(address == null ? "正在获取位置.." : address, (value) {
                    print("callback-----------$value");
                    HistoryManager.getInstance().addRecord(value);
                    ApiClient.getWeatherData(cityCode: (value as CityEntity).cityCode).then((value) {
                      setState(() {
                        data = value;
                      });
                    });
                  }),
                ],
              )),
          new Expanded(child: new Forecast(data))
        ],
      )),
    );
  }

  Widget getWeatherWidget() {
    if (data != null) {
      return new Weather(data);
    } else {
      return Container();
    }
  }
}
