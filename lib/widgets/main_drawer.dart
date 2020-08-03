import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget _buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.black54,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 80,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            alignment: Alignment.bottomLeft,
            color: _theme.primaryColor,
            child: Text(
              'Que Fominha!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 26,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          _buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
