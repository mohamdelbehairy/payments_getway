class ItemListModel {
  List<Items>? items;

  ItemListModel({this.items});

  ItemListModel.fromJson(Map<String, dynamic> json) {
    if (json["items"] is List) {
      items = json["items"] == null
          ? null
          : (json["items"] as List).map((e) => Items.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data["items"] = items?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  Items({this.name, this.quantity, this.price, this.currency});

  Items.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["quantity"] is int) {
      quantity = json["quantity"];
    }
    if (json["price"] is String) {
      price = json["price"];
    }
    if (json["currency"] is String) {
      currency = json["currency"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["quantity"] = quantity;
    data["price"] = price;
    data["currency"] = currency;
    return data;
  }
}
