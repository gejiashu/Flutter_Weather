
import 'dart:ui';

class $Colors{
  static final Color blueParis = const Color(0xDD595877);
}

class $Api{
  static final String url = "http://t.weather.sojson.com/api/weather/city/";

  static String getBaiduUrl(double lat,double long){
    return "http://api.map.baidu.com/geocoder?location=$lat,$long&output=json&ak=KGKvHgumRLSAE07aAwGGcUX4";
  }
}