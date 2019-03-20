import 'dart:convert';

import 'package:flutter_weather/entity_factory.dart';
import 'package:flutter_weather/model/city_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryManager {
  static HistoryManager _historyManager;
  static const String HISTORY_KEY = "history";
  List<CityEntity> historyData = List<CityEntity>();

  static HistoryManager getInstance() {
    if (_historyManager == null) {
      _historyManager = HistoryManager();
    }
    return _historyManager;
  }

  List<CityEntity> getHistoryData() {
    return historyData;
  }

  initHistoryData() async {
    historyData.clear();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String data = sharedPreferences.getString(HISTORY_KEY);
    if (data != null && data.isNotEmpty) {
      List<dynamic> list = json.decode(data);
      for (dynamic item in list) {
        CityEntity entity = EntityFactory.generateOBJ(item);
        historyData.add(entity);
      }
    }
  }

  addRecord(CityEntity cityEntity) async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    for (CityEntity history in historyData) {
      if (history.cityCode == cityEntity.cityCode) {
        historyData.remove(history);
        break;
      }
    }

    historyData.insert(0, cityEntity);
    if (historyData.length > 5) {
      historyData.removeRange(5, historyData.length);
    }
    print(json.encode(historyData));
    await sharedPreferences.setString(HISTORY_KEY, json.encode(historyData));
  }
}
