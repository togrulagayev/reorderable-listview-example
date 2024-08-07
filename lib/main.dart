import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Flexify(
      designHeight: 932,
      designWidth: 430,
      app: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Demo App',
        home: HomeScreen(),
      ),
    );
  }
}
