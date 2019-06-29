import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:weather/common/color_scheme.dart' as colors;
import 'package:weather/homepage/additional_info.dart';
import 'package:weather/homepage/homepage_screen_base.dart';
import 'package:weather/ui_models/menu_icon.dart';

class Weekly extends StatelessWidget implements HomepageScreen {
  @override
  final Widget appBar = AppBar(
    leading: IconButton(
      icon: MenuIcon(),
      onPressed: () {},
    ),
    backgroundColor: colors.grayBackground,
    elevation: 0,
  );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: TopInfos(
              appBar: appBar,
              dayOfTheWeek: "Friday",
              icon: FontAwesomeIcons.cloudRain,
              maxTemperature: "32",
              minTemperature: "24",
            ),
          ),
        );
      },
    );
  }
}

class TopInfos extends StatelessWidget {
  const TopInfos({
    @required this.appBar,
    @required this.icon,
    @required this.dayOfTheWeek,
    @required this.maxTemperature,
    @required this.minTemperature,
    Key key,
  }) : super(key: key);

  final Widget appBar;
  final IconData icon;
  final String dayOfTheWeek;
  final String maxTemperature;
  final String minTemperature;

  static const double _horizontalPadding = 50;

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Column(
          children: <Widget>[
            appBar,
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: deviceSize.width,
                minHeight: deviceSize.height / 3,
              ),
              child: Container(
                color: colors.grayBackground,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: _horizontalPadding,
                        vertical: 32,
                      ),
                      child: Text(
                        "Weekly Chart",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: _horizontalPadding,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Icon(
                                  icon,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(
                                  dayOfTheWeek,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    color: colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Text(
                                  maxTemperature,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(
                                  minTemperature,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: colors.grayBlack,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: _horizontalPadding,
                        right: _horizontalPadding,
                        bottom: 32,
                        top: 10,
                      ),
                      child: AdditionalInfo(
                        hasTitle: false,
                        humidity: "55 %",
                        uv: "1",
                        visibility: "25 km",
                        wind: "12 m/h",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        HourlyForecast(),
        WeeklyForecastRow(
          activeIndex: 3,
        ),
      ],
    );
  }
}

class HourlyForecast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          for (int i = 0; i < 4; i++)
            HourlyForecastItem(
              weather: "Cloudy",
              minTemperature: "9",
              maxTemperature: "31,9",
            ),
        ],
      ),
    );
  }
}

class HourlyForecastItem extends StatelessWidget {
  const HourlyForecastItem({
    Key key,
    @required this.minTemperature,
    @required this.maxTemperature,
    @required this.weather,
  }) : super(key: key);

  final String minTemperature;
  final String maxTemperature;
  final String weather;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      dense: true,
      leading: Text(
        minTemperature,
        style: const TextStyle(
          fontSize: 16,
          color: colors.black,
          fontWeight: FontWeight.bold,
        ),
      ), // min
      title: Text(
        weather,
        style: const TextStyle(
          fontSize: 22,
          color: colors.black,
          fontWeight: FontWeight.w500,
        ),
      ), // text
      trailing: Text(
        maxTemperature,
        style: const TextStyle(
          fontSize: 20,
          color: colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class WeeklyForecastRow extends StatelessWidget {
  final int activeIndex;

  const WeeklyForecastRow({
    @required this.activeIndex,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          for (int i = 0; i < 7; i++)
            WeeklyForecastItem(
              active: i == activeIndex,
            )
        ],
      ),
    );
  }
}

class WeeklyForecastItem extends StatelessWidget {
  final bool active;

  const WeeklyForecastItem({
    @required this.active,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          Icons.cloud,
          color: active ? colors.black : colors.grayBlack,
        ),
        Padding(
          padding: const EdgeInsets.all(5),
        ),
        Text('S'),
      ],
    );
  }
}
