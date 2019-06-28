import 'package:flutter/material.dart';

import 'package:weather/common/color_scheme.dart' as colors;

import 'package:weather/homepage/homepage_screen_base.dart';
import 'package:weather/homepage/home_screen/custom_bottom_appbar.dart';
import 'package:weather/homepage/home_screen/home.dart';
import 'package:weather/homepage/weekly_screen/weekly.dart';


class HomePage extends StatelessWidget {
  final List<HomepageScreen> _screens = [
    Home(),
    Weekly(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomAppBar(),
      backgroundColor: colors.white,
      body: Weekly(),  // temporary
    );
  }
}
