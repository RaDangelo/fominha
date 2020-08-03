import 'package:flutter/material.dart';
import 'package:fominha/models/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavorite, this.isFavorite);

  Widget _buildSectionTitle(ThemeData _theme, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(title, style: _theme.textTheme.headline6),
    );
  }

  Widget _buildContainer(Widget _child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: _child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _mealId = ModalRoute.of(context).settings.arguments;
    final _meal = DUMMY_MEALS.firstWhere((element) => element.id == _mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(_meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                _meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _buildSectionTitle(_theme, 'Ingredients'),
            _buildContainer(ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  color: _theme.accentColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      _meal.ingredients[index],
                    ),
                  ),
                );
              },
              itemCount: _meal.ingredients.length,
            )),
            _buildSectionTitle(_theme, 'Steps'),
            _buildContainer(ListView.builder(
              itemBuilder: (ctx, index) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(_meal.steps[index]),
                    ),
                    Divider()
                  ],
                );
              },
              itemCount: _meal.steps.length,
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(_mealId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFavorite(_mealId),
      ),
    );
  }
}
