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
      home: const Enterpage(),
      routes: {
        homeRoute: (context) => const Datapage(),
        searchRoute: (context) => const Startingpage(),
      },
    );
  }
}

class Enterpage extends StatefulWidget {
  const Enterpage({super.key});

  @override
  State<Enterpage> createState() => _EnterpageState();
}

class _EnterpageState extends State<Enterpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          heightFactor: 15,
          child: SafeArea(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(searchRoute, (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                  backgroundColor: Colors.white,
                ),
                child: const Text(
                  'Enter',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
