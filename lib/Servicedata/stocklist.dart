// ignore_for_file: avoid_print
import 'dart:developer' as devtools show log;
import 'dart:convert';
import 'package:groww/constant/appdata.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:groww/module/stockdata.dart';

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
    print(Appdata.info);
    print(Appdata.timerange);
    print(Appdata.timevalue);

    final response = await http.get(Uri.parse(
        'https://api.polygon.io/v2/aggs/ticker/${Appdata.info}/range/${Appdata.timevalue}/${Appdata.timerange}/${Appdata.fdate.year.toString()}-${Appdata.fdate.month.toString()}-${Appdata.fdate.day.toString()}/${Appdata.tdate.year.toString()}-${Appdata.tdate.month.toString()}-${Appdata.tdate.day.toString()}?adjusted=true&sort=desc&limit=120&apiKey=XHWn5rxwMg43uWADwVN1a_kiBDszlfVb'));
    print(jsonDecode(response.body));

    if (response.statusCode == 200) {
      stockList.add(stockDataFromJson(response.body));
      print(jsonDecode(response.body));
      // if (jsonDecode(response.body).isNotEmpty) {
      //   Map<String, dynamic> map = jsonDecode(response.body);
      //   stockList.add(StockData.fromJson(map));
      // }
    } else {
      throw Exception();
    }
    devtools.log(stockList[0].resultsCount);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: fetchstock(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
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
          case ConnectionState.done:
            return ListView.builder(
              itemCount: stockList[0].resultsCount,
              itemBuilder: (context, index) {
                var convo = DateTime.fromMillisecondsSinceEpoch(
                    stockList[0].results[index].t);
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
                            color: Colors.grey[200],
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
                          //  print("itemCount"),
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
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 28,
                                    ),
                                    Text(
                                      "High:\$${stockList[0].results[index].h.toString()}",
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
                                  padding: const EdgeInsets.all(7.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Open:\$${stockList[0].results[index].o.toString()}",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 37,
                                      ),
                                      Text(
                                        "Close:\$${stockList[0].results[index].c.toString()}",
git                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 15,
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
          case ConnectionState.none:
            return const Center(child: Text("Check Your Internet"));
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
