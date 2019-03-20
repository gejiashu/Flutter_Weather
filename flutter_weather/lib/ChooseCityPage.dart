import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_weather/HistoryCityHeader.dart';
import 'package:flutter_weather/Res.dart';
import 'package:flutter_weather/model/CityList.dart';
import 'package:flutter_weather/model/city_entity.dart';

class ChooseCityPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChooseCityPageState();
  }
}

class ChooseCityPageState extends State<ChooseCityPage> {
  Map<CityEntity, List<CityEntity>> cityData;

  @override
  void initState() {
    super.initState();
    final result =
        DefaultAssetBundle.of(context).loadString("assets/data/city.json");
    result.then((value) {
      List<dynamic> data = json.decode(value);
      final cityList = CityList.fromJson(data);
      setState(() {
        cityData = buildData(cityList.data);
      });
    });
  }

  Map<CityEntity, List<CityEntity>> buildData(List<CityEntity> data) {
    Map<int, CityEntity> provience = {};
    Map<CityEntity, List<CityEntity>> result = {};
    for (CityEntity cityEntity in data) {
      if (cityEntity.pid == 0) {
        provience[cityEntity.id] = cityEntity;
        result[cityEntity] = null;
        print("省份：${cityEntity.cityName}");
      } else {
        CityEntity shengfen = provience[cityEntity.pid];
        if (shengfen != null) {
          var list = result[shengfen];
          if (list == null) {
            list = List<CityEntity>();
            result[shengfen] = list;
          }
          list.add(cityEntity);
        }
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: $Colors.blueParis,
          title: Container(
            width: double.infinity,
            child: Stack(
              children: <Widget>[
                Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )),
                Center(child: Text("选择省份"))
              ],
            ),
          ),
        ),
        body: buildBody(),
      ),
      onWillPop: () {
        Navigator.of(context).pop();
      },
    );
  }

  Widget buildBody() {
    if (cityData == null) {
      return Center(
          child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation($Colors.blueParis),
      ));
    } else {
      return ListView.builder(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {

            if(index ==0){
              return HistoryCityHeader();
            }

            return InkWell(
              child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.black12))),
                  padding: EdgeInsets.only(left: 12),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        cityData.keys.toList()[index-1].cityName,
                        style:
                            TextStyle(color: $Colors.blueParis, fontSize: 18),
                      ))),
              onTap: () {
                final cityEntity = cityData.keys.toList()[index-1];
                final values = cityData[cityEntity];
                Navigator.of(context)
                    .pushNamed("/router/choose_city", arguments: values).then((value){
                      Navigator.pop(context,value);
                });
              },
            );
          },
          itemCount: cityData.length+1);
    }
  }
}
