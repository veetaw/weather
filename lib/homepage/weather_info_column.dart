import 'package:flutter/material.dart';

import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'weather_info_column.g.dart';

@widget
Widget weatherInfoColumn(
  BuildContext context, {
  @required String hour,
  @required IconData icon,
  @required String temperature,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      Text(
        hour,
        style: TextStyle(color: Colors.white),
      ),
      Icon(
        icon,
        color: Colors.white,
      ),
      Text(
        temperature,
        style: TextStyle(color: Colors.white),
      ),
    ],
  );
}
