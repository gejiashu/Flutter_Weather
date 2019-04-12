import 'package:flutter/material.dart';
import 'package:flutter_weather/forecast_pager.dart';
import 'package:flutter_weather/model/weather_data_entity.dart';

class Forecast extends StatefulWidget {
  final WeatherDataEntity data;

  const Forecast(this.data, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ForecastState();
  }
}

class ForecastState extends State<Forecast> with TickerProviderStateMixin {
  double defaultTranslationY = 0;
  double delta = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    defaultTranslationY = MediaQuery.of(context).size.width * 805.0 / 750.0;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data == null) {
      return Container();
    }
    return Transform.translate(
        offset: Offset(0, defaultTranslationY + delta),
        child: GestureDetector(
          child: Container(
            child: new ForecastPager(widget.data),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, -5))
                ]),
          ),
          onVerticalDragEnd: _onVerticalDragEnd,
          onVerticalDragUpdate: _onVerticalDragUpdate,
        ));
  }

  _onVerticalDragEnd(DragEndDetails details) {
    if (details.primaryVelocity > 1000) {
      animate(false);
    } else if (details.primaryVelocity < -1000) {
      animate(true);
    } else {
      if (delta <
          -(context.size.height -
                  (MediaQuery.of(context).size.height - defaultTranslationY)) /
              2) {
        animate(true);
      } else {
        animate(false);
      }
    }
  }

  _onVerticalDragUpdate(DragUpdateDetails details) {
    print("onVerticalDragUpdate------------");
    delta += details.delta.dy;
    if (delta > 0) {
      delta = 0;
    } else {
      if (delta <
          -(context.size.height -
              (MediaQuery.of(context).size.height - defaultTranslationY))) {
        delta = -(context.size.height -
            (MediaQuery.of(context).size.height - defaultTranslationY));
      }
    }
    setState(() {});
  }

  animate(bool isTop) {
    if (!isTop) {
      final controller = AnimationController(
          duration: Duration(milliseconds: 300), vsync: this);
      final curved =
          CurvedAnimation(parent: controller, curve: Curves.decelerate);
      final animation = Tween(begin: delta, end: 0.0).animate(curved);
      animation.addListener(() {
        delta = animation.value;
        setState(() {});
      });
      controller.forward();
    } else {
      final controller = AnimationController(
          duration: Duration(milliseconds: 300), vsync: this);
      final curved =
          CurvedAnimation(parent: controller, curve: Curves.decelerate);
      final animation = Tween(
              begin: delta,
              end: -(context.size.height -
                  (MediaQuery.of(context).size.height - defaultTranslationY)))
          .animate(curved);
      animation.addListener(() {
        delta = animation.value;
        setState(() {});
      });
      controller.forward();
    }
  }
}
