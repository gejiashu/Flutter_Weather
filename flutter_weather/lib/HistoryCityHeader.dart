import 'package:flutter/material.dart';
import 'package:flutter_weather/HistoryManager.dart';
import 'package:flutter_weather/Res.dart';
import 'package:flutter_weather/model/city_entity.dart';

class HistoryCityHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black12))),
          padding: EdgeInsets.only(left: 12, top: 10, bottom: 10),
          child: Text("历史记录(最多只显示五个记录)",
              style: TextStyle(fontSize: 13, color: $Colors.blueParis)),
        ),
        Container(
          child: initContentWidget(context),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black12))),
        ),
      ],
    ));
  }

  Widget initContentWidget(BuildContext context) {
    if (HistoryManager.getInstance().getHistoryData().length == 0) {
      return Container(
          height: 56,
          width: double.infinity,
          child: Align(
              child: Text("暂无历史数据",
                  style: TextStyle(color: $Colors.blueParis, fontSize: 18))),
          alignment: Alignment.center);
    } else {
      return GridView.count(
        crossAxisCount: 3,
        children: initWidgets(context),
        mainAxisSpacing: 12,
        crossAxisSpacing: 30,
        padding: EdgeInsets.only(left: 12, top: 10, right: 12, bottom: 10),
        shrinkWrap: true,
        physics: ScrollPhysics(),
        childAspectRatio: 3.0,
      );
    }
  }

  List<Widget> initWidgets(BuildContext context) {
    List<CityEntity> data = HistoryManager.getInstance().getHistoryData();
    final widgets = List<Widget>();
    for (CityEntity entity in data) {
      widgets.add(generateWidget(context, entity));
    }
    return widgets;
  }

  Widget generateWidget(BuildContext context, CityEntity city) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            border: Border.all(color: $Colors.blueParis, width: 0.5)),
        child: Center(
            child: Text(
          city.cityName,
          style: TextStyle(color: $Colors.blueParis, fontSize: 15),
        )),
      ),
      onTap: () {
        Navigator.pop(context, city);
      },
    );
  }
}
