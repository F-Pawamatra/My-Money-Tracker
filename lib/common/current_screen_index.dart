
import '/screens/expenses_screen.dart';
import '/screens/settings_screen.dart';
import '/screens/home_page_screen.dart';
import '/screens/incomes_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrentScreenIndex extends StatelessWidget {
  final int index;

  CurrentScreenIndex(
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 1:
        {
          return IncomesScreen();
        }
        break;
      case 2:
        {
          return ExpensesScreen();
        }
        break;
      case 3:
        {
          return SettingsScreen();
        }
        break;
      default:
        {
          return HomePageScreen();
        }
        break;
    }
  }
}