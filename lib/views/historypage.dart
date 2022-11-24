import 'package:flutter/material.dart';
import 'package:groww/constant/appdata.dart';

import '../module/historydata.dart';

class Historypage extends StatefulWidget {
  const Historypage({super.key});

  @override
  State<Historypage> createState() => _HistorypageState();
}

class _HistorypageState extends State<Historypage> {
  String value = "value${Appdata.count}";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "History",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        Appdata.count = 0;
                        Appdata.hisinfo.clear();
                        Appdata.histime.clear();
                        Appdata.hisrange.clear();
                      });
                    },
                    child: const Text(
                      "Clear",
                      style: TextStyle(fontSize: 16),
                    )),
              ),
              const Historycard(),
            ],
          ),
        ),
      ),
    );
  }
}
