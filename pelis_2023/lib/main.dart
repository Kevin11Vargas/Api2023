import 'package:flutter/material.dart';
import 'package:pelis_2023/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ('PELICULAS'),
      initialRoute: 'home',
      routes: {
        'home': (_) => HomeScreen(),
        'details' :(_) => DetailsScreen(),
      },
    );
  }
}