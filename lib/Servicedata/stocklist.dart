// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:groww/module/stockdata.dart';
import 'package:groww/views/startingpage.dart';

final List dataList = [
  "AAPL",
  "MSFT",
  "GOOGL",
  "TSLA",
  "AMZN",
  "TCS",
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

class StockCard extends StatefulWidget {
  const StockCard({super.key});

  @override
  State<StockCard> createState() => _StockCardState();
}

class _StockCardState extends State<StockCard> {
  late Future<StockData?> fetchdata;
  List<dynamic> stockList = [];
  Future<void> fetchstock() async {
    print('hey10');
    for (var i = 0; i < 15; i++) {
      print('hey11');
      final response = await http.get(Uri.parse(
          'https://api.polygon.io/v2/aggs/ticker/${dataList[0]}/range/15/minute/2021-07-22/2021-07-22?adjusted=true&sort=desc&limit=120&apiKey=XHWn5rxwMg43uWADwVN1a_kiBDszlfVb'));
      print('hey12');
      if (response.statusCode == 200) {
        print('hey13');
        // String values;
        print('hey14');
        // values = ;
        print('hey15');
        if (jsonDecode(response.body).isNotEmpty) {
          print('hey2');
          print(jsonDecode(response.body));
          print('hey4');
          Map<String, dynamic> map = jsonDecode(response.body);
          print('hey5');
          print(stockList[0].results.length);
          stockList.add(StockData.fromJson(map));
        }

        setState(() {
          stockList;
        });
      } else {
        throw Exception();
      }
    }
  }

  @override
  void initState() {
    fetchstock();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchstock(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const CircularProgressIndicator();
          case ConnectionState.done:
            return ListView.builder(
              itemCount: stockList[0].results.length,
              itemBuilder: (context, index) {
                var convo = DateTime.fromMillisecondsSinceEpoch(
                    stockList[index].results[index].t);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        child: Container(
                          width: MediaQuery.of(context).size.width - 16,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(4, 4),
                                blurRadius: 10,
                                spreadRadius: 1,
                              ),
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(-4, -4),
                                blurRadius: 10,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.fromLTRB(10, 5, 1, 1),
                          child: Row(
                            children: [
                              Container(
                                // height: 80,
                                alignment: Alignment.topLeft,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      convo.toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 28,
                                    ),
                                    Text(
                                      "High:\$${stockList[index].results[index].h.toString()}",
                                      style: const TextStyle(
                                        color: Colors.green,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(9.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Open:\$${stockList[index].results[index].o.toString()}",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 28,
                                      ),
                                      Text(
                                        "Close:\$${stockList[index].results[index].c.toString()}",
                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
            );
          default:
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  height: 300,
                ),
                Center(child: CircularProgressIndicator()),
              ],
            );
        }
      },
    );
  }
}