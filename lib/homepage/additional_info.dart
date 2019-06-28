import 'package:flutter/material.dart';

import 'package:functional_widget_annotation/functional_widget_annotation.dart';

import 'package:weather/common/color_scheme.dart' as colors;

part 'additional_info.g.dart';

@widget
Widget additionalInfo(
  BuildContext context, {
  @required String wind,
  @required String humidity,
  @required String visibility,
  @required String uv,
  bool hasTitle = true,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      hasTitle
          ? Text(
              "Additional Info",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )
          : Container(),
      Padding(
        padding: EdgeInsets.only(top: 32),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          AdditionalInfoTitleColumn(
            upper: "Wind",
            lower: "Visibility",
          ),
          AdditionalInfoSubtitleColumn(
            upper: wind,
            lower: visibility,
          ),
          AdditionalInfoTitleColumn(
            upper: "Humidity",
            lower: "UV",
          ),
          AdditionalInfoSubtitleColumn(
            upper: humidity,
            lower: uv,
          ),
        ],
      ),
    ],
  );
}

@widget
Widget additionalInfoTitleColumn(
  BuildContext context, {
  @required String upper,
  @required String lower,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      AdditionalInfoTitle(
        title: upper,
      ),
      Padding(
        padding: EdgeInsets.only(top: 16),
      ),
      AdditionalInfoTitle(
        title: lower,
      ),
    ],
  );
}

@widget
Widget additionalInfoSubtitleColumn(
  BuildContext context, {
  @required String upper,
  @required String lower,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      AdditionalInfoSubtitle(
        subtitle: upper,
      ),
      Padding(
        padding: EdgeInsets.only(top: 16),
      ),
      AdditionalInfoSubtitle(
        subtitle: lower,
      ),
    ],
  );
}

@widget
Widget additionalInfoTitle(
  BuildContext context, {
  @required String title,
}) {
  return Text(
    title,
    style: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
    ),
  );
}

@widget
Widget additionalInfoSubtitle(
  BuildContext context, {
  @required String subtitle,
}) {
  return Text(
    subtitle,
    style: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: colors.grayBlack,
    ),
  );
}
