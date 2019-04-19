
import 'dart:ui';

import 'package:flutter/material.dart';

import 'Res.dart';
import 'model/weather_data_entity.dart';
import 'dart:math' as Math;
class TemperatureTrend extends StatelessWidget{
  final WeatherDataEntity data;
  TemperatureTrend(this.data);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: MyPainter(data),);
  }

}

class MyPainter extends CustomPainter{
  WeatherDataEntity data;
  double min = double.infinity;
  double max = double.negativeInfinity;
  double textSize = 11.0;
  MyPainter(this.data){
    int count = 0;
    for(WeatherDataDataForecast forecast  in data.data.forecast){
      count++;
      if(count>=6){
        break;
      }
      final double low = getLowTemperature(forecast.low);
      final double high = getHighTemperature(forecast.high);
      max = Math.max(max, high);
      min = Math.min(low, min);

    }
  }

  @override
  void paint(Canvas canvas, Size size) {
     double left = size.width/10;
     Offset lastLowPoint;
     Offset lastTopPoint;
     int count = 0;
    for(WeatherDataDataForecast forecast in data.data.forecast){
      count++;
      if(count>=6){
        break;
      }
      double highTop = textSize+(size.height-textSize*2)/(max-min)*(max-getHighTemperature(forecast.high));
      double lowTop = textSize+(size.height-textSize*2)/(max-min)*(max-getLowTemperature(forecast.low));
      Offset highPoint = Offset(left,highTop);
      Offset lowPoint = Offset(left,lowTop);
      drawPoint(canvas, highPoint);
      drawPoint(canvas, lowPoint);
      Paint linePaint = Paint();
      linePaint.color = $Colors.blueParis;
      linePaint.strokeWidth = 1;
      if(lastLowPoint!=null){
        canvas.drawLine(lastLowPoint, lowPoint,linePaint);
      }
      if(lastTopPoint!=null){
        canvas.drawLine(lastTopPoint, highPoint, linePaint);
      }

      TextPainter textPaint = TextPainter(text:TextSpan(text: "${getHighTemperature(forecast.high)}℃",style: TextStyle(fontSize: textSize,color: $Colors.blueParis)),textDirection: TextDirection.ltr);
      textPaint.layout();
      textPaint.paint(canvas, Offset(highPoint.dx-textPaint.size.width/2,highPoint.dy-4-textPaint.size.height));

      textPaint = TextPainter(text:TextSpan(text: "${getLowTemperature(forecast.low)}℃",style: TextStyle(fontSize: textSize,color: $Colors.blueParis)),textDirection: TextDirection.ltr);
      textPaint.layout();
      textPaint.paint(canvas, Offset(lowPoint.dx-textPaint.size.width/2,lowPoint.dy+4));
      lastTopPoint = highPoint;
      lastLowPoint = lowPoint;
      left += size.width/5;
    }



  }





  drawPoint(Canvas canvas,Offset offset ){
    Paint paint = Paint();
    paint.color = $Colors.blueParis;
    canvas.drawCircle(offset, 3, paint);
  }

  double getLowTemperature(String low){
    return double.parse(low.replaceAll("低温", "").replaceAll("℃", "").trim());
  }

  double getHighTemperature(String high){
    return double.parse(high.replaceAll("高温", "").replaceAll("℃", "").trim());
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    if (oldDelegate != this) {
      return true;
    }
    return false;
  }
}