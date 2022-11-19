import 'package:flutter/material.dart';
import 'package:groww/constant/appdata.dart';
import '../Servicedata/stocklist.dart';

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
  Future refresh() async {
    setState(() {
      const StockCard();
    });
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
      body: RefreshIndicator(
        onRefresh: refresh,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: const [
                StockCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
