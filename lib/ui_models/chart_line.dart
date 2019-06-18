import 'package:flutter/material.dart';

import 'package:functional_widget_annotation/functional_widget_annotation.dart';

import 'package:weather/common/color_scheme.dart' as colors;

part 'chart_line.g.dart';

@widget
Widget chartLine(
  BuildContext context, {
  @required startPoint,
  @required endPoint,
}) {
  return CustomPaint(
    painter: _ChartLinePainter(
      startPoint: startPoint,
      endPoint: endPoint,
      lineColor: colors.secondaryBlack,
    ),
  );
}

class _ChartLinePainter extends CustomPainter {
  final Offset startPoint;
  final Offset endPoint;
  final Color lineColor;
  final Color _indicatorColor;

  _ChartLinePainter({
    @required this.startPoint,
    @required this.endPoint,
    @required this.lineColor,
    Color indicatorColor,
  }) : this._indicatorColor = indicatorColor ?? lineColor;

  static const double _lineStroke = 2;
  static const double _indicatorStroke = 4;
  static const double _indicatorRadius = 6;
  static const double _indicatorShadeRadius = 10;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint _linePaint = Paint();
    _linePaint.color = lineColor;
    _linePaint.strokeWidth = _lineStroke;

    Offset _endPoint =
        Offset(endPoint.dx - _indicatorRadius, endPoint.dy - _indicatorRadius);
    canvas.drawLine(startPoint, _endPoint, _linePaint);

    Paint _indicatorPaint = Paint();
    _indicatorPaint.color = _indicatorColor;
    _indicatorPaint.strokeWidth = _indicatorStroke;
    _indicatorPaint.style = PaintingStyle.stroke;

    canvas.drawCircle(endPoint, _indicatorRadius, _indicatorPaint);

    Paint circleShadowPaint = Paint();
    circleShadowPaint.color = _indicatorColor.withAlpha(40);
    circleShadowPaint.strokeWidth = _indicatorStroke;
    circleShadowPaint.style = PaintingStyle.stroke;

    canvas.drawCircle(endPoint, _indicatorShadeRadius, circleShadowPaint);
  }

  @override
  bool shouldRepaint(_ChartLinePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_ChartLinePainter oldDelegate) => false;
}
