import 'package:flutter/material.dart';

import 'package:weather/common/color_scheme.dart' as colors;

import 'package:weather/homepage/home/custom_bottom_appbar.dart';
import 'package:weather/homepage/home/home.dart';
import 'package:weather/homepage/weekly/weekly.dart';
import 'package:weather/ui_models/menu_icon.dart';

class HomePage extends StatelessWidget {
  final List<Widget> _screens = [
    Home(),
    Weekly(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context, "Weather forecast"),
      bottomNavigationBar: CustomBottomAppBar(),
      backgroundColor: colors.white,
      body: Home(),
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
                  color: colors.black,
                  fontSize: 16,
                ),
          ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}

