import 'package:flutter/material.dart';

import './mainTheme.dart';
import './widgets/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _title = 'Que Fominha!';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: MainTheme().themeData,
      home: CategoriesScreen(),
    );
  }
}
