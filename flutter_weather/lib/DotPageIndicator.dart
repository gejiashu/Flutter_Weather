import 'package:flutter/material.dart';

class DotPageIndicator extends StatelessWidget {
  final int pageCount;
  final int currentPage;

  DotPageIndicator(this.pageCount, this.currentPage);

  @override
  Widget build(BuildContext context) {
    final dots = List<Widget>();

    final emptyDot = Container(
        child: Image.asset("assets/img/dotEmpty.png", width: 15, height: 15),
        margin: EdgeInsets.fromLTRB(2, 0, 2, 0));
    final fullDot = Container(
        child: Image.asset(
          "assets/img/dotBlueishFull.png",
          width: 15,
          height: 15,
        ),
        margin: EdgeInsets.fromLTRB(2, 0, 2, 0));
    for (var i = 0; i < pageCount; i++) {
      if (currentPage == i) {
        dots.add(fullDot);
      } else {
        dots.add(emptyDot);
      }
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: dots,
    );
  }
}
