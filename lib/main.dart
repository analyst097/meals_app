import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories.screen.dart';
import 'package:meals_app/screens/tabs.screen.dart';


final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        // theme: theme,
        home: TabsScreen()
    );
  }
}