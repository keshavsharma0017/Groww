import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:groww/constant/pop_up.dart';
import 'package:groww/constant/route.dart';
import '../constant/appdata.dart';
// import 'dart:developer' as devtools show log;

class Homepage extends StatefulWidget {
  const Homepage({
    super.key,
  });
  static late String? equity;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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

    Future<bool> showExitPopup() async {
      return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Exit App'),
              content: const Text('Do you want to exit?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('No'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Yes'),
                ),
              ],
            ),
          ) ??
          false;
    }

    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 95, 111, 255),
          title: const Center(
            child: Text(
              '  Groww',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 120,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 95, 111, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: DropdownButton<String>(
                        value: Appdata.info,
                        dropdownColor: const Color.fromARGB(255, 95, 111, 255),
                        items: stocks.map((String item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        style: const TextStyle(color: Colors.white),
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
                        backgroundColor:
                            const Color.fromARGB(255, 95, 111, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: DropdownButton(
                        underline: Container(),
                        value: Appdata.timerange,
                        dropdownColor: const Color.fromARGB(255, 95, 111, 255),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        elevation: 16,
                        items: time.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        style: const TextStyle(color: Colors.white),
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
                        backgroundColor:
                            const Color.fromARGB(255, 95, 111, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: DropdownButton(
                        underline: Container(),
                        value: Appdata.timevalue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        elevation: 16,
                        dropdownColor: const Color.fromARGB(255, 95, 111, 255),
                        items: range.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        style: const TextStyle(color: Colors.white),
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
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'From :',
                          style: TextStyle(
                            color: Color.fromARGB(255, 95, 111, 255),
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
                              log("${Appdata.fdate}");
                            });
                          },
                          style: TextButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 95, 111, 255),
                              minimumSize: const Size(100, 30)),
                          child: Text(
                            "${Appdata.fdate.year.toString()}-${Appdata.fdate.month.toString()}-${Appdata.fdate.day.toString()}",
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        const Text(
                          'To',
                          style: TextStyle(
                            color: Color.fromARGB(255, 95, 111, 255),
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
                              log("${Appdata.tdate}");
                            });
                          },
                          style: TextButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 95, 111, 255),
                            minimumSize: const Size(100, 30),
                          ),
                          child: Text(
                            "${Appdata.tdate.year.toString()}-${Appdata.tdate.month.toString()}-${Appdata.tdate.day.toString()}",
                            style: const TextStyle(
                              color: Colors.white,
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

                          

                          Appdata.hisinfo.add(Appdata.info);
                          Appdata.hisrange.add(Appdata.timerange);
                          Appdata.histime.add(Appdata.timevalue);
                          Appdata.count++;
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 95, 111, 255),
                        minimumSize: const Size(150, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Show Stocks',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        log(Appdata.count.toString());
                        log(Appdata.hisinfo.toString());
                        log(Appdata.hisrange.toString());
                        log(Appdata.histime.toString());

                        if (Appdata.count == 0) {
                          popUp(context, "History is Empty");
                          // const snackBar = SnackBar(
                          //   content: Text(
                          //     "History is Empty",
                          //     textAlign: TextAlign.center,
                          //   ),
                          // );
                          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else if (Appdata.fdate.isBefore(DateTime.now()) &&
                            Appdata.tdate.isBefore(DateTime.now()) &&
                            Appdata.count != 0) {
                          Navigator.of(context).pushNamed(historyRoute);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 95, 111, 255),
                        minimumSize: const Size(150, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'History',
                        style: TextStyle(
                          color: Colors.white,
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
                      color: Color.fromARGB(255, 95, 111, 255),
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
