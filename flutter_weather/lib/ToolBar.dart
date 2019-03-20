import 'package:flutter/material.dart';
import 'package:flutter_weather/LocationClient.dart';
import 'package:flutter_weather/Res.dart';

typedef Callback = Function (dynamic value);

class ToolBar extends StatelessWidget {

  final Callback callback;
  final String address;
  const ToolBar(this.address,this.callback);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 44,
      margin: EdgeInsets.only(top: 24),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Align(
              child: IconButton(
                  icon: Icon(Icons.add, color: $Colors.blueParis),
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("/router/choose_province")
                        .then((value) {
                      callback(value);
                    });
                  }),
              alignment: Alignment.centerRight),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.my_location,size: 18,color: $Colors.blueParis),
              Text(address,style: TextStyle(color: $Colors.blueParis,fontSize: 18),)
            ],
          )
        ],
      ),
    );
  }
}
