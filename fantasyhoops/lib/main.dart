import 'package:fantasyhoops/auth/signUp.dart';
import 'package:fantasyhoops/initialLeague.dart';
import 'package:flutter/material.dart';
import 'package:fantasyhoops/route.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FantasyHoops',
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black26),
        useMaterial3: true,
      ),
      home: const InitialLeague(),
    );
  }
}