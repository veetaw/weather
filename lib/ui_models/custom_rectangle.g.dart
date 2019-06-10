// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_rectangle.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class CustomRectangle extends StatelessWidget {
  const CustomRectangle(
      {Key key,
      this.backgroundColor,
      this.foregroundColor,
      @required this.indicatorType,
      this.onTap,
      this.margin,
      this.child})
      : super(key: key);

  final Color backgroundColor;

  final Color foregroundColor;

  final IndicatorType indicatorType;

  final void Function() onTap;

  final EdgeInsetsGeometry margin;

  final Widget child;

  @override
  Widget build(BuildContext _context) => customRectangle(_context,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      indicatorType: indicatorType,
      onTap: onTap,
      margin: margin,
      child: child);
}
