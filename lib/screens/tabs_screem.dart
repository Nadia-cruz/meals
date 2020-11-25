import 'package:flutter/material.dart';

import 'categories_screen.dart';
import 'Favorite_screem.dart';
import '../components/main_drawer.dart';
import '../models/meal.dart';

class TabsScreem extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabsScreem(this.favoriteMeals);
  @override
  _TabsScreemState createState() => _TabsScreemState();
}

class _TabsScreemState extends State<TabsScreem> {
  int _selectScreemIndex = 0;
  List<Map<String, Object>> _screens;
  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'title': 'Lista de categorias',
        'screen': CategoriesScreen(),
      },
      {
        'title': 'Lista de categorias',
        'screen': FavoriteScreen(widget.favoriteMeals),
      },
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectScreemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _screens[_selectScreemIndex]['title'],
        ),
      ),
      drawer: MainDrawer(),
      body: _screens[_selectScreemIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectScreemIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categorias'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favoritos'),
          ),
        ],
      ),
    );
  }
}
