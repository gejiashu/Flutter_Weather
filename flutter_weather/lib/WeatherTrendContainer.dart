
import 'package:flutter/material.dart';

import 'Res.dart';
class WeatherTrendContainer extends StatelessWidget{
  final Widget child;
  WeatherTrendContainer(this.child);

  @override
  Widget build(BuildContext context) {
    return Container(child:CustomPaint(painter:MyPainter(),child:child) ,width: double.infinity,height: 280);
  }
}

class MyPainter extends CustomPainter{


  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = $Colors.blueParis;
    for(int i=0;i<4;i++){
      canvas.drawLine(Offset(size.width/5*(i+1),0), Offset(size.width/5*(i+1),size.height), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    if(oldDelegate!=this){
      return true;
    }
    return false;
  }
}