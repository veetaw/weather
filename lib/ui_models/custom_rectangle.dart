import 'package:flutter/material.dart';

import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'custom_rectangle.g.dart';

enum IndicatorType { start, middle, end }

@widget
Widget customRectangle(
  BuildContext context, {
  Color backgroundColor,
  Color foregroundColor,
  @required IndicatorType indicatorType,
  GestureTapCallback onTap,
  EdgeInsetsGeometry margin,
  Widget child,
}) {
  final double _borderRadius = 24;
  final double _bigBorderRadius = 50;
  return InkWell(
    onTap: onTap,
    child: SizedBox(
      width: 120,
      height: 200,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        color: backgroundColor,
        margin: margin ?? const EdgeInsets.all(0),
        child: CustomPaint(
          painter: _CustomRectanglePainter(
            borderRadius: _borderRadius,
            bigCornerBorder:
                indicatorType != IndicatorType.middle ? _bigBorderRadius : 0,
            backgroundColor: foregroundColor,
            isOnTop: indicatorType != IndicatorType.start,
          ),
          child: child,
        ),
      ),
    ),
  );
}

class _CustomRectanglePainter extends CustomPainter {
  final double borderRadius;
  final double bigCornerBorder;
  final Color backgroundColor;
  final bool isOnTop;

  const _CustomRectanglePainter({
    @required this.borderRadius,
    @required this.backgroundColor,
    this.bigCornerBorder,
    this.isOnTop = true,
  })  : assert(borderRadius != null),
        assert(backgroundColor != null),
        assert(isOnTop != null);

  @override
  void paint(Canvas canvas, Size size) {
    final Radius _bigCornerBorderRadius = Radius.circular(bigCornerBorder ?? 0);
    final Radius _borderRadius = Radius.circular(borderRadius);

    final Paint _paint = Paint();
    _paint.color = backgroundColor;
    _paint.style = PaintingStyle.fill;

    final _halfHeight = size.height / 2;
    RRect _rRect;

    if (bigCornerBorder != null && !isOnTop)
      _rRect = RRect.fromRectAndCorners(
        Rect.fromLTWH(0, _halfHeight, size.width, _halfHeight),
        bottomLeft: _borderRadius,
        bottomRight: _borderRadius,
        topLeft: _bigCornerBorderRadius,
      );
    else
      _rRect = RRect.fromRectAndCorners(
        Rect.fromLTWH(0, 0, size.width, _halfHeight),
        topLeft: _borderRadius,
        topRight: _borderRadius,
        bottomRight: _bigCornerBorderRadius,
      );

    canvas.drawRRect(_rRect, _paint);
  }

  @override
  bool shouldRepaint(_CustomRectanglePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_CustomRectanglePainter oldDelegate) => false;
}
