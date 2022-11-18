class Appdata {
  final String value;
  final String show;

  static String info = "AAPL";
  static String timerange = "minute";
  static String timevalue = "15";
  static DateTime fdate = DateTime(2022, 11, 18);
  static DateTime tdate = DateTime(2022, 11, 18);

  Appdata({required this.value, required this.show});
}

List<Appdata> appdata1 = [
  Appdata(value: 'AAPL', show: 'Apple'),
  Appdata(value: 'MSFT', show: 'Microsoft'),
  Appdata(value: 'GOOGL', show: 'Google'),
  Appdata(value: 'TCS', show: 'Tata'),
  Appdata(value: 'TSLA', show: 'Tesla'),
  Appdata(value: 'AMZN', show: 'Amazon'),
  Appdata(value: 'UNH', show: 'UN Health'),
  Appdata(value: 'JNJ', show: 'Johnson'),
  Appdata(value: 'JPM', show: 'JPmorgan'),
  Appdata(value: 'AMJ', show: 'Jpmogan.C'),
  Appdata(value: 'WMT', show: 'Walmart'),
  Appdata(value: 'CVX', show: 'Chevron'),
  Appdata(value: 'META', show: 'Metaverse'),
  Appdata(value: 'TM', show: 'Toyota'),
  Appdata(value: 'BABA', show: 'Alibaba'),
];
