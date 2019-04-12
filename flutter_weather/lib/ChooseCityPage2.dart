import 'package:flutter/material.dart';
import 'package:flutter_weather/Res.dart';
import 'package:flutter_weather/model/city_entity.dart';

class ChooseCityPage2 extends StatelessWidget {
  final List<CityEntity> data;

  const ChooseCityPage2(this.data);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: $Colors.blueParis,
          automaticallyImplyLeading: false,
          title: Stack(
            children: <Widget>[
              Center(
                child: Text("选择城市",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }))
            ],
          ),
        ),
        body: ListView.builder(
          itemBuilder: (_, int index) {
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
                        data[index].cityName,
                        style:
                            TextStyle(color: $Colors.blueParis, fontSize: 17),
                      ))),
              onTap: () {
                Navigator.of(context).pop(data[index]);
              },
            );
          },
          itemCount: data.length,
        ),
      ),
      onWillPop: () {
        Navigator.of(context).pop();
      },
    );
  }
}
