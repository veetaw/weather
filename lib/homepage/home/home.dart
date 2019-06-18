import 'package:flutter/material.dart';

import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:weather/common/color_scheme.dart' as colors;
import 'package:weather/homepage/home/additional_info.dart';
import 'package:weather/homepage/home/weather_info_column.dart';
import 'package:weather/ui_models/custom_rectangle.dart';

part 'home.g.dart';

final GlobalKey _temperatureTextKey = GlobalKey();
final GlobalKey _locationTextKey = GlobalKey();
final GlobalKey _indicatorIconKey = GlobalKey();
final List<Key> _clickableTextKeys = List.generate(3, (_) => GlobalKey());
final List<Key> _indicatorRectangleKeys = List.generate(3, (_) => GlobalKey());

class Home extends StatelessWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Center(
            child: IndicatorIcon(
              icon: Icons.wb_sunny,
              key: _indicatorIconKey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16),
          ),
          Center(
            child: TemperatureText(
              temperature: "39,9°",
              key: _temperatureTextKey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16),
          ),
          Center(
            child: LocationText(
              location: "Tbilisi, Georgia",
              key: _locationTextKey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 32),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClickableText(
                text: "Today",
                enabled: true,
                onTap: () {},
                key: _clickableTextKeys[0],
              ),
              ClickableText(
                text: "Tomorrow",
                enabled: false,
                onTap: () {},
                key: _clickableTextKeys[1],
              ),
              ClickableText(
                text: "After",
                enabled: false,
                onTap: () {},
                key: _clickableTextKeys[2],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomRectangle(
                backgroundColor: colors.orange,
                foregroundColor: colors.red,
                indicatorType: IndicatorType.start,
                margin: EdgeInsets.symmetric(horizontal: 5),
                key: _indicatorRectangleKeys[0],
                child: WeatherInfoColumn(
                  icon: FontAwesomeIcons.cloudRain,
                  hour: "18:00",
                  temperature: "12°",
                ),
              ),
              CustomRectangle(
                backgroundColor: colors.purple,
                foregroundColor: colors.violet,
                indicatorType: IndicatorType.middle,
                margin: EdgeInsets.symmetric(horizontal: 5),
                key: _indicatorRectangleKeys[1],
                child: WeatherInfoColumn(
                  icon: FontAwesomeIcons.sun,
                  hour: "19:00",
                  temperature: "19°",
                ),
              ),
              CustomRectangle(
                backgroundColor: colors.darkBlue,
                foregroundColor: colors.blue,
                indicatorType: IndicatorType.end,
                margin: EdgeInsets.symmetric(horizontal: 5),
                key: _indicatorRectangleKeys[2],
                child: WeatherInfoColumn(
                  icon: FontAwesomeIcons.moon,
                  hour: "22:00",
                  temperature: "12°",
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 50),
            child: AdditionalInfo(
              wind: "12 m/h",
              visibility: "25 km",
              humidity: "55 %",
              uv: "1",
            ),
          ),
        ],
      ),
    );
  }
}

@widget
Widget temperatureText(BuildContext context, {@required String temperature}) {
  return Text(
    temperature,
    style: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
    ),
  );
}

@widget
Widget locationText(BuildContext context, {@required String location}) {
  return Text(
    location,
    style: TextStyle(
      fontSize: 20,
      color: colors.secondaryBlack,
      fontWeight: FontWeight.w500,
    ),
  );
}

@widget
Widget indicatorIcon(BuildContext context, {@required IconData icon}) {
  return Icon(
    icon,
    size: 36,
    color: Colors.orangeAccent,
  );
}

@widget
Widget clickableText(
  BuildContext context, {
  @required String text,
  @required GestureTapCallback onTap,
  bool enabled: false,
}) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: colors.black.withAlpha(enabled ? 255 : 90),
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}