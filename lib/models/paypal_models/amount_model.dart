class AmountModel {
  final String? total;
  final String? currency;
  final Details? details;

  AmountModel(
      {required this.total, required this.currency, required this.details});

  factory AmountModel.fromJson(Map<String, dynamic> json) {
    return AmountModel(
      total: json["total"],
      currency: json["currency"],
      details:
          json["details"] == null ? null : Details.fromJson(json["details"]),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["total"] = total;
    data["currency"] = currency;
    if (details != null) {
      data["details"] = details?.toJson();
    }
    return data;
  }
}

class Details {
  String? subtotal;
  String? shipping;
  int? shippingDiscount;

  Details({this.subtotal, this.shipping, this.shippingDiscount});

  Details.fromJson(Map<String, dynamic> json) {
    if (json["subtotal"] is String) {
      subtotal = json["subtotal"];
    }
    if (json["shipping"] is String) {
      shipping = json["shipping"];
    }
    if (json["shipping_discount"] is int) {
      shippingDiscount = json["shipping_discount"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["subtotal"] = subtotal;
    data["shipping"] = shipping;
    data["shipping_discount"] = shippingDiscount;
    return data;
  }
}
