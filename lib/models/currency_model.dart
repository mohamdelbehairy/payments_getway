class CurrencyModel {
  String? base;
  Result? result;
  String? updated;
  int? ms;

  CurrencyModel({this.base, this.result, this.updated, this.ms});

  CurrencyModel.fromJson(Map<String, dynamic> json) {
    if (json["base"] is String) {
      base = json["base"];
    }
    if (json["result"] is Map) {
      result = json["result"] == null ? null : Result.fromJson(json["result"]);
    }
    if (json["updated"] is String) {
      updated = json["updated"];
    }
    if (json["ms"] is int) {
      ms = json["ms"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["base"] = base;
    if (result != null) {
      data["result"] = result?.toJson();
    }
    data["updated"] = updated;
    data["ms"] = ms;
    return data;
  }
}

class Result {
  double? egp;

  Result({this.egp});

  Result.fromJson(Map<String, dynamic> json) {
    if (json["EGP"] is double) {
      egp = json["EGP"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["EGP"] = egp;
    return data;
  }
}
