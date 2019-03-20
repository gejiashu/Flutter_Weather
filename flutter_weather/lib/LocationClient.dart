import 'package:flutter/services.dart';
import 'package:location/location.dart';

class LocationClient {
  // ignore: non_constant_identifier_names
  static LocationClient _Instance;

  static LocationClient getInstance() {
    if (_Instance == null) {
      _Instance = LocationClient();
    }
    return _Instance;
  }

  Future<Map<String,double>> getCurrentCity() async {
    final location = new Location();
    try {
      final locationData = await location.getLocation();
      print("lat:${locationData.latitude} long:${locationData.longitude}");
      return {"lat": locationData.latitude, "long": locationData.longitude};
    } on PlatformException catch (e) {
      print("获取位置信息异常");
    }
    return null;
  }
}
