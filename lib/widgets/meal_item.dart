import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String mealId;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    @required this.mealId,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });

  String get _complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simples';
      case Complexity.Challenging:
        return 'Médio';
      case Complexity.Simple:
        return 'Difícil';
      default:
        return '???';
    }
  }

  List<Icon> get _affordabilityValue {
    switch (affordability) {
      case Affordability.Affordable:
        return [
          const Icon(Icons.attach_money),
        ];
      case Affordability.Pricey:
        return [
          const Icon(Icons.attach_money),
          const Icon(Icons.attach_money),
        ];
      case Affordability.Luxurious:
        return [
          const Icon(Icons.attach_money),
          const Icon(Icons.attach_money),
          const Icon(Icons.attach_money),
        ];
      default:
        return [];
    }
  }

  void _selectMeal(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(
      MealDetailScreen.routeName,
      arguments: mealId,
    )
        .then((result) {
      if (result != null) {
        // removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: const Radius.circular(15),
                    topRight: const Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 0,
                  child: Container(
                    width: 340,
                    color: Colors.black54,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.schedule,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.work,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(_complexityText),
                    ],
                  ),
                  Row(
                    children: <Widget>[..._affordabilityValue],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
