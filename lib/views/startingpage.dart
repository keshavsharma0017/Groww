// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:groww/constant/route.dart';
// import 'dart:developer' as devtools show log;
import '../constant/appdata.dart';

class Startingpage extends StatefulWidget {
  const Startingpage({
    super.key,
  });
  static late String? equity;

  @override
  State<Startingpage> createState() => _StartingpageState();
}

class _StartingpageState extends State<Startingpage> {
  @override
  Widget build(BuildContext context) {
    var stocks = [
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
      "NVDA",
      "LLY",
      "MA",
      "MMM",
      "XOM",
      "KO",
      "PEP",
      "MCD",
      "NKE",
    ];

    var time = [
      "minute",
      "hour",
      "day",
    ];
    var range = [
      "1",
      "15",
      "30",
      "45",
      "60",
    ];
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 95, 111, 255),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              const Text(
                '  Groww',
                // textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              // ...newlist, //have to remove
              const SizedBox(
                height: 180,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: DropdownButton<String>(
                      value: Appdata.info,
                      items: stocks.map((String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        return setState(() {
                          Appdata.info = value!;
                        });
                      },
                      underline: Container(),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      elevation: 16,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: DropdownButton(
                      underline: Container(),
                      value: Appdata.timerange,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      elevation: 16,
                      items: time.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? value) {
                        setState(() {
                          Appdata.timerange = value!;
                        });
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: DropdownButton(
                      underline: Container(),
                      value: Appdata.timevalue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      elevation: 16,
                      items: range.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? value) {
                        setState(() {
                          Appdata.timevalue = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 120,
              ),
              Column(
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'From :',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      TextButton(
                        onPressed: () async {
                          DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: Appdata.fdate,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );
                          if (newDate == null) return;
                          setState(() {
                            Appdata.fdate = newDate;
                            // Appdata.fdate = newDate.toString();
                            print(Appdata.fdate);
                          });
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            minimumSize: const Size(100, 30)),
                        child: Text(
                          "${Appdata.fdate.year.toString()}-${Appdata.fdate.month.toString()}-${Appdata.fdate.day.toString()}",
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      const Text(
                        'To',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      TextButton(
                        onPressed: () async {
                          DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: Appdata.tdate,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );
                          if (newDate == null) return;
                          setState(() {
                            Appdata.tdate = newDate;
                            // Appdata.tdate = newDate.toString();
                            print(Appdata.tdate);
                          });
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          minimumSize: const Size(100, 30),
                        ),
                        child: Text(
                          "${Appdata.tdate.year.toString()}-${Appdata.tdate.month.toString()}-${Appdata.tdate.day.toString()}",
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (Appdata.fdate.isBefore(DateTime.now()) &&
                          Appdata.tdate.isBefore(DateTime.now())) {
                        Navigator.of(context).pushNamed(homeRoute);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: const Size(150, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Show Stocks',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              const Text(
                '(Please wait atleast 30 seconds before making another Request)',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
