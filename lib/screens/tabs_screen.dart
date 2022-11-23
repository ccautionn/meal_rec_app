import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import './favorites_screen.dart';
import './catagories_screen.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabScreen({super.key, required this.favoriteMeals});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>>? _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'title': 'Categories', 'page': const CategoriesScreen()},
      {
        'title': 'Your Favorites',
        'page': FavoriteScreen(favoriteMeals: widget.favoriteMeals)
      }
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages?[_selectedPageIndex]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: _pages?[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).colorScheme.primary,
                icon: Icon(Icons.category),
                label: 'Categories'),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).colorScheme.primary,
                icon: Icon(Icons.star),
                label: 'Favorites')
          ]),
    );
  }
}
