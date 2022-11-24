import 'package:shared_preferences/shared_preferences.dart';

class Appdata {
  final String value;
  final String show;

  static String info = "AMZN";
  static String timerange = "minute";
  static String timevalue = "15";
  static int totalresults = 0;
  static DateTime fdate = DateTime(2022, 11, 17);
  static DateTime tdate = DateTime(2022, 11, 18);
  static int count = 0;
  static List hisinfo = [];
  static List histime = [];
  static List hisrange = [];



  Appdata({required this.value, required this.show});
}

class History {
  final String sname;
  final String srange;
  final String svalue;

  History(this.sname, this.srange, this.svalue);
}

late List<History> historydata;
  
  Future<SharedPreferences> Function() sp = SharedPreferences.getInstance;
