import 'package:flutter/material.dart';

import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:weather/common/color_scheme.dart' as colors;

part 'custom_bottom_appbar.g.dart';

@widget
Widget customBottomAppBar(BuildContext context) {
  return Container(
    color: colors.white,
    padding: EdgeInsets.only(left: 16, right: 16, bottom: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        FlatButton.icon(
          icon: Icon(FontAwesomeIcons.home, color: colors.grayBlack),
          label: Text(
            "Home",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: colors.grayBlack,
            ),
          ),
          onPressed: () {},
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.cloudSunRain),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.settings, color: colors.grayBlack),
              onPressed: () {},
            ),
          ],
        ),
      ],
    ),
  );
}
