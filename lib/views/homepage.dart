import 'package:flutter/material.dart';
import 'package:groww/constant/appdata.dart';
import '../Servicedata/stocklist.dart';
import 'package:groww/views/startingpage.dart';

late final String symbol;
late final List stockList;
final List dataList = [
  "AAPL",
  "MSFT",
  "GOOGL",
  "TCS",
  "TSLA",
  "AMZN",
  "UNH",
  "JNJ",
  "JPM",
  "AMJ",
  "WMT",
  "CVX",
  "META",
  "TM",
  "BABA",
];

class Datapage extends StatefulWidget {
  const Datapage({super.key});

  @override
  State<Datapage> createState() => _DatapageState();
}

class _DatapageState extends State<Datapage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
            child: Text(
          Appdata.info,
          style:
              const TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
        )),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              StockCard(),
            ],
          ),
        ),
      ),
    );
  }
}
