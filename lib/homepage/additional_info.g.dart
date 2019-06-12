// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'additional_info.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class AdditionalInfo extends StatelessWidget {
  const AdditionalInfo(
      {Key key,
      @required this.wind,
      @required this.humidity,
      @required this.visibility,
      @required this.uv})
      : super(key: key);

  final String wind;

  final String humidity;

  final String visibility;

  final String uv;

  @override
  Widget build(BuildContext _context) => additionalInfo(_context,
      wind: wind, humidity: humidity, visibility: visibility, uv: uv);
}

class AdditionalInfoTitleColumn extends StatelessWidget {
  const AdditionalInfoTitleColumn(
      {Key key, @required this.upper, @required this.lower})
      : super(key: key);

  final String upper;

  final String lower;

  @override
  Widget build(BuildContext _context) =>
      additionalInfoTitleColumn(_context, upper: upper, lower: lower);
}

class AdditionalInfoSubtitleColumn extends StatelessWidget {
  const AdditionalInfoSubtitleColumn(
      {Key key, @required this.upper, @required this.lower})
      : super(key: key);

  final String upper;

  final String lower;

  @override
  Widget build(BuildContext _context) =>
      additionalInfoSubtitleColumn(_context, upper: upper, lower: lower);
}

class AdditionalInfoTitle extends StatelessWidget {
  const AdditionalInfoTitle({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext _context) =>
      additionalInfoTitle(_context, title: title);
}

class AdditionalInfoSubtitle extends StatelessWidget {
  const AdditionalInfoSubtitle({Key key, @required this.subtitle})
      : super(key: key);

  final String subtitle;

  @override
  Widget build(BuildContext _context) =>
      additionalInfoSubtitle(_context, subtitle: subtitle);
}
