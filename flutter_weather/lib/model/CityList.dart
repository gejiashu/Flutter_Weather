import 'dart:convert';

import 'package:flutter_weather/model/city_entity.dart';

class CityList {
  List<CityEntity> data;

  CityList.fromJson(List<dynamic> cities) {
    data = List<CityEntity>();
    for (dynamic str in cities) {
      data.add(CityEntity.fromJson(str as Map<String, dynamic>));
    }
  }

  String toJson() {
    return json.encode(data);
  }
}
