import 'dart:convert';

StockData stockDataFromJson(String str) => StockData.fromJson(json.decode(str));

String stockDataToJson(StockData data) => json.encode(data.toJson());

class StockData {
    StockData({
        required this.ticker,
        required this.queryCount,
        required this.resultsCount,
        required this.adjusted,
        required this.results,
        required this.status,
        required this.requestId,
        required this.count,
    });

    String ticker;
    int queryCount;
    int resultsCount;
    bool adjusted;
    List<Result> results;
    String status;
    String requestId;
    int count;

    factory StockData.fromJson(Map<String, dynamic> json) => StockData(
        ticker: json["ticker"],
        queryCount: json["queryCount"],
        resultsCount: json["resultsCount"],
        adjusted: json["adjusted"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        status: json["status"],
        requestId: json["request_id"],
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "ticker": ticker,
        "queryCount": queryCount,
        "resultsCount": resultsCount,
        "adjusted": adjusted,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "status": status,
        "request_id": requestId,
        "count": count,
    };
}

class Result {
    Result({
        required this.v,
        required this.vw,
        required this.o,
        required this.c,
        required this.h,
        required this.l,
        required this.t,
        required this.n,
    });

    int v;
    double vw;
    double o;
    double c;
    double h;
    double l;
    int t;
    int n;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        v: json["v"].toInt(),
        vw: json["vw"].toDouble(),
        o: json["o"].toDouble(),
        c: json["c"].toDouble(),
        h: json["h"].toDouble(),
        l: json["l"].toDouble(),
        t: json["t"].toInt(),
        n: json["n"].toInt(),
    );

    Map<String, dynamic> toJson() => {
        "v": v,
        "vw": vw,
        "o": o,
        "c": c,
        "h": h,
        "l": l,
        "t": t,
        "n": n,
    };
}
