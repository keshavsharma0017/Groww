import 'package:flutter/material.dart';
import 'package:groww/constant/route.dart';
import 'package:groww/views/homepage.dart';
import 'package:groww/views/startingpage.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Startingpage(),
      routes: {
        homeRoute: (context) => const Datapage(),
        searchRoute: (context) => const Startingpage(),
      },
    );
  }
}
