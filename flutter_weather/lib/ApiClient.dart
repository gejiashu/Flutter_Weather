import 'dart:convert';

import 'package:flutter_weather/Res.dart';
import 'package:flutter_weather/model/baidu_location_entity.dart';
import 'package:flutter_weather/entity_factory.dart';
import 'package:flutter_weather/model/weather_data_entity.dart';
import 'package:http/http.dart' as Http;


class ApiClient {
  static Future<WeatherDataEntity> getWeatherData(
      {String cityCode = "101280101"}) async {
    final response = await Http.get($Api.url + cityCode);
    final map = json.decode(response.body);
    print("json:${response.body}");
    WeatherDataEntity data = EntityFactory.generateOBJ(map);
    return data;
  }

  static Future<BaiduLocationEntity> getBaiduLocation(double lat,double long) async{
    final response = await Http.get($Api.getBaiduUrl(lat, long));
    final map = json.decode(response.body);
    print("baidu location:${map}");
    BaiduLocationEntity data =EntityFactory.generateOBJ(map);
    return data;
  }

}
