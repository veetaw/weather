import 'package:flutter/material.dart';

import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:weather/homepage/weather_info_column.dart';
import 'package:weather/ui_models/menu_icon.dart';
import 'package:weather/ui_models/custom_rectangle.dart';

part 'homepage.g.dart';

final Color _black = Color(0xff121825);

final GlobalKey _temperatureTextKey = GlobalKey();
final GlobalKey _locationTextKey = GlobalKey();
final GlobalKey _indicatorIconKey = GlobalKey();
final List<Key> _clickableTextKeys = List.generate(3, (_) => GlobalKey());
final List<Key> _indicatorRectangleKeys = List.generate(3, (_) => GlobalKey());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context, "Weather forecast"),
      backgroundColor: Color(0xffE5E5E5),
      body: SingleChildScrollView(
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
                  backgroundColor: Color(0xffF38757),
                  foregroundColor: Color(0xffDF7080),
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
                  backgroundColor: Color(0xff775B8A),
                  foregroundColor: Color(0xffB66293),
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
                  backgroundColor: Color(0xff2C4758),
                  foregroundColor: Color(0xff475678),
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
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, String title) {
    return AppBar(
      leading: IconButton(
        icon: MenuIcon(),
        onPressed: () {},
      ),
      title: Text(title),
      textTheme: Theme.of(context).primaryTextTheme.copyWith(
            title: Theme.of(context).primaryTextTheme.title.copyWith(
                  color: _black,
                  fontSize: 16,
                ),
          ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
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
      color: _black.withAlpha(130),
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
          color: _black.withAlpha(enabled ? 255 : 90),
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}

@widget
Widget additionalInfo(
  BuildContext context, {
  @required String wind,
  @required String humidity,
  @required String visibility,
  @required String uv,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        "Additional Info",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
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
      color: Colors.black.withAlpha(90),
    ),
  );
}
