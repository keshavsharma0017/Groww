import 'package:flutter/material.dart';
import 'package:groww/constant/route.dart';
import 'package:groww/views/historypage.dart';
import 'package:groww/views/stockpage.dart';
import 'package:groww/views/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Groww",
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.black)),
      themeMode: ThemeMode.dark,
      home: const Homepage(),
      routes: {
        homeRoute: (context) => const Stockpage(),
        searchRoute: (context) => const Homepage(),
        historyRoute: (context) => const Historypage(),
      },
    );
  }
}
