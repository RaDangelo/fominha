import 'package:flutter/material.dart';

import './mainTheme.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import './screens/meal_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _title = 'Que Fominha!';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: MainTheme().themeData,
      initialRoute: '/',
      routes: {
        CategoriesScreen.routeName: (_) => CategoriesScreen(),
        CategoryMealsScreen.routeName: (_) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (_) => MealDetailScreen(),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
