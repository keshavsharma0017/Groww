import 'dart:io';

import 'package:flutter/material.dart';
import 'package:groww/constant/appdata.dart';
import '../Servicedata/stocklist.dart';

class Stockpage extends StatefulWidget {
  const Stockpage({super.key});

  @override
  State<Stockpage> createState() => _StockpageState();
}

class _StockpageState extends State<Stockpage> {
  @override
  void initState() {
    super.initState();
    checkUserConnection();
  }

  bool activeConnection = false;
  String T = "";

  Future checkUserConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          activeConnection = true;
        });
      }
    } on SocketException catch (_) {
      setState(() {
        activeConnection = false;
        T = "Turn On the data and Try again";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 95, 111, 255),
        title: Text(
          Appdata.info,
          style:
              const TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () {
            return checkUserConnection();
          },
          child: SingleChildScrollView(
            child: activeConnection
                ? Column(
                    children: const [
                      StockCard(),
                    ],
                  )
                : Center(
                    heightFactor: 35,
                    child: Text(
                      T,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
