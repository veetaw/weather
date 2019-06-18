import 'package:flutter/material.dart';

import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'menu_icon.g.dart';

@widget
Widget menuIcon(
  BuildContext context, {
  Color color,
  double length,
  double secondLineLength,
}) {
  return CustomPaint(
    painter: MenuIconPainter(
      length ??
          24, // functional_widget_annotation does not support default values
      secondLineLength: secondLineLength,
      color: color ?? Theme.of(context).accentIconTheme.color,
    ),
  );
}

@visibleForTesting
class MenuIconPainter extends CustomPainter {
  final double length;
  final double secondLineLength;
  final Color color;

  static const double _strokeWidth = 2;
  static const double _spaceBetweenLines = 5;

  const MenuIconPainter(
    this.length, {
    this.color = Colors.black,
    double secondLineLength,
  })  : assert(length != null),
        this.secondLineLength =
            secondLineLength == null ? length / 2 : secondLineLength;

  @override
  void paint(Canvas canvas, Size size) {
    Paint _paint = Paint();
    _paint.color = Colors.black;
    _paint.strokeWidth = _strokeWidth;

    canvas.drawLine(Offset(0, 0), Offset(length, 0), _paint);
    canvas.drawLine(Offset(0, _spaceBetweenLines),
        Offset(secondLineLength, _spaceBetweenLines), _paint);
  }

  @override
  bool shouldRepaint(MenuIconPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(MenuIconPainter oldDelegate) => false;
}
