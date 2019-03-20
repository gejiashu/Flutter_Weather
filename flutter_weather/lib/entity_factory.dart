import 'package:flutter_weather/model/baidu_location_entity.dart';
import 'package:flutter_weather/model/city_entity.dart';
import 'package:flutter_weather/model/weather_data_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "BaiduLocationEntity") {
      return BaiduLocationEntity.fromJson(json) as T;
    } else if (T.toString() == "CityEntity") {
      return CityEntity.fromJson(json) as T;
    } else if (T.toString() == "WeatherDataEntity") {
      return WeatherDataEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}