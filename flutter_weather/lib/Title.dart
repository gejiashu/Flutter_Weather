import 'package:flutter/material.dart';
import 'package:flutter_weather/Res.dart';

class TitleText extends StatelessWidget {
  final String title;
  final String text;

  TitleText(this.title, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black12))),
      child: Row(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(color: $Colors.blueParis, fontSize: 17),
          ),
          Container(
              margin: EdgeInsets.only(left: 12),
              child: Text(text,
                  style: TextStyle(color: $Colors.blueParis, fontSize: 17)))
        ],
      ),
    );
  }
}
