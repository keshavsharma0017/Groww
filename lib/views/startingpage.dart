import 'package:flutter/material.dart';
import 'package:groww/constant/route.dart';
import 'dart:developer' as devtools show log;
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
  final TextEditingController _toDate = TextEditingController();
  final TextEditingController _fromDate = TextEditingController();

  @override
  void initState() {
    _fromDate.text = "";
    _toDate.text = "";
    super.initState();
  }

  // final _validationKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final newlist = appdata1.map((Appdata) {
      final String show = Appdata.show;
      return Text(show);
    }).toList();

    DateTime fdate = DateTime(2022, 11, 18);
    DateTime tdate = DateTime(2022, 12, 18);
    // Initial Selected Value
    String stock = 'Stocks';
    String spam = 'Time';
    String rangespam = 'range';

    // List of items in our dropdown menu
    var stocks = [
      "Stocks",
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

    var time = [
      "Time",
      "minute",
      "hour",
      "day",
    ];
    var range = [
      "range",
      "15",
      "30",
      "45",
      "60",
    ];
    String val = newlist[0].toString();

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
                    child: DropdownButton(
                      value: stock,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      elevation: 16,
                      items: stocks.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          Appdata.info = value!;
                          print(Appdata.info);
                          stock = value;
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
                      value: spam,
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
                          print(Appdata.timerange);
                          spam = value;
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
                      value: rangespam,
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
                          print(Appdata.timevalue);
                          rangespam = value;
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
                            initialDate: fdate,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );
                          if (newDate == null) return;
                          setState(() {
                            Appdata.fdate = newDate.toString();
                            print(Appdata.fdate);
                          });
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            minimumSize: const Size(100, 30)),
                        child: Text(
                          "${fdate.day}/${fdate.month}/${fdate.year}",
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
                            initialDate: tdate,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );
                          if (newDate == null) return;
                          setState(() {
                            Appdata.tdate = newDate.toString();
                            print(Appdata.tdate);
                          });
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          minimumSize: const Size(100, 30),
                        ),
                        child: Text(
                          "${tdate.day}/${tdate.month}/${tdate.year}",
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
                      Navigator.of(context).pushNamed(homeRoute);
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
            ],
          ),
        ),
      ),
    );
  }
}
