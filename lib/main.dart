import "package:JrC_flutter_course/dummy-data.dart";
import 'package:JrC_flutter_course/screens/categories_screen.dart';
import 'package:JrC_flutter_course/screens/category_meals_screen.dart';
import 'package:JrC_flutter_course/screens/meal_detail_screen.dart';
import 'package:JrC_flutter_course/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = DUMMY_MEALS;
  // Step 1
  List<Meal> _favoritedMeals = [];

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoritedMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoritedMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoritedMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String mealId) {
    return _favoritedMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Jrc Awesome Flutter Course",
        theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                bodyText1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                headline6: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
        initialRoute: '/',
        routes: {
          // Step 6
          '/': (ctx) => TabsScreen(_favoritedMeals),
          CategoryMealsScreen.routeName: (ctx) =>
              CategoryMealsScreen(_availableMeals),
          // Step 7
          MealDetailScreen.routeName: (ctx) =>
              MealDetailScreen(_toggleFavorite, _isMealFavorite),
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
        });
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text("Velkommen til JrC Flutter-kurs"),
    ));
  }
}
