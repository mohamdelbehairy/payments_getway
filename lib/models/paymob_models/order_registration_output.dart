class OrderRegistrationOutput {
  int? id;
  String? createdAt;
  String? deliveryNeeded;
  Merchant? merchant;
  String? collector;
  int? amountCents;
  ShippingData? shippingData;
  String? currency;
  String? isPaymentLocked;
  String? merchantOrderId;
  String? walletNotification;
  int? paidAmountCents;
  List<dynamic>? items;

  OrderRegistrationOutput(
      {this.id,
      this.createdAt,
      this.deliveryNeeded,
      this.merchant,
      this.collector,
      this.amountCents,
      this.shippingData,
      this.currency,
      this.isPaymentLocked,
      this.merchantOrderId,
      this.walletNotification,
      this.paidAmountCents,
      this.items});

  OrderRegistrationOutput.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if (json["delivery_needed"] is String) {
      deliveryNeeded = json["delivery_needed"];
    }
    if (json["merchant"] is Map) {
      merchant =
          json["merchant"] == null ? null : Merchant.fromJson(json["merchant"]);
    }
    if (json["collector"] is String) {
      collector = json["collector"];
    }
    if (json["amount_cents"] is int) {
      amountCents = json["amount_cents"];
    }
    if (json["shipping_data"] is Map) {
      shippingData = json["shipping_data"] == null
          ? null
          : ShippingData.fromJson(json["shipping_data"]);
    }
    if (json["currency"] is String) {
      currency = json["currency"];
    }
    if (json["is_payment_locked"] is String) {
      isPaymentLocked = json["is_payment_locked"];
    }
    if (json["merchant_order_id"] is String) {
      merchantOrderId = json["merchant_order_id"];
    }
    if (json["wallet_notification"] is String) {
      walletNotification = json["wallet_notification"];
    }
    if (json["paid_amount_cents"] is int) {
      paidAmountCents = json["paid_amount_cents"];
    }
    if (json["items"] is List) {
      items = json["items"] ?? [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["created_at"] = createdAt;
    data["delivery_needed"] = deliveryNeeded;
    if (merchant != null) {
      data["merchant"] = merchant?.toJson();
    }
    data["collector"] = collector;
    data["amount_cents"] = amountCents;
    if (shippingData != null) {
      data["shipping_data"] = shippingData?.toJson();
    }
    data["currency"] = currency;
    data["is_payment_locked"] = isPaymentLocked;
    data["merchant_order_id"] = merchantOrderId;
    data["wallet_notification"] = walletNotification;
    data["paid_amount_cents"] = paidAmountCents;
    if (items != null) {
      data["items"] = items;
    }
    return data;
  }
}

class ShippingData {
  int? id;
  String? firstName;
  String? lastName;
  String? street;
  String? building;
  String? floor;
  String? apartment;
  String? city;
  String? state;
  String? country;
  String? email;
  String? phoneNumber;
  String? postalCode;
  String? extraDescription;
  String? shippingMethod;
  int? orderId;
  int? order;

  ShippingData(
      {this.id,
      this.firstName,
      this.lastName,
      this.street,
      this.building,
      this.floor,
      this.apartment,
      this.city,
      this.state,
      this.country,
      this.email,
      this.phoneNumber,
      this.postalCode,
      this.extraDescription,
      this.shippingMethod,
      this.orderId,
      this.order});

  ShippingData.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["first_name"] is String) {
      firstName = json["first_name"];
    }
    if (json["last_name"] is String) {
      lastName = json["last_name"];
    }
    if (json["street"] is String) {
      street = json["street"];
    }
    if (json["building"] is String) {
      building = json["building"];
    }
    if (json["floor"] is String) {
      floor = json["floor"];
    }
    if (json["apartment"] is String) {
      apartment = json["apartment"];
    }
    if (json["city"] is String) {
      city = json["city"];
    }
    if (json["state"] is String) {
      state = json["state"];
    }
    if (json["country"] is String) {
      country = json["country"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["phone_number"] is String) {
      phoneNumber = json["phone_number"];
    }
    if (json["postal_code"] is String) {
      postalCode = json["postal_code"];
    }
    if (json["extra_description"] is String) {
      extraDescription = json["extra_description"];
    }
    if (json["shipping_method"] is String) {
      shippingMethod = json["shipping_method"];
    }
    if (json["order_id"] is int) {
      orderId = json["order_id"];
    }
    if (json["order"] is int) {
      order = json["order"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["first_name"] = firstName;
    data["last_name"] = lastName;
    data["street"] = street;
    data["building"] = building;
    data["floor"] = floor;
    data["apartment"] = apartment;
    data["city"] = city;
    data["state"] = state;
    data["country"] = country;
    data["email"] = email;
    data["phone_number"] = phoneNumber;
    data["postal_code"] = postalCode;
    data["extra_description"] = extraDescription;
    data["shipping_method"] = shippingMethod;
    data["order_id"] = orderId;
    data["order"] = order;
    return data;
  }
}

class Merchant {
  int? id;
  String? createdAt;
  List<String>? phones;
  List<String>? companyEmails;
  String? companyName;
  String? state;
  String? country;
  String? city;
  String? postalCode;
  String? street;

  Merchant(
      {this.id,
      this.createdAt,
      this.phones,
      this.companyEmails,
      this.companyName,
      this.state,
      this.country,
      this.city,
      this.postalCode,
      this.street});

  Merchant.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if (json["phones"] is List) {
      phones =
          json["phones"] == null ? null : List<String>.from(json["phones"]);
    }
    if (json["company_emails"] is List) {
      companyEmails = json["company_emails"] == null
          ? null
          : List<String>.from(json["company_emails"]);
    }
    if (json["company_name"] is String) {
      companyName = json["company_name"];
    }
    if (json["state"] is String) {
      state = json["state"];
    }
    if (json["country"] is String) {
      country = json["country"];
    }
    if (json["city"] is String) {
      city = json["city"];
    }
    if (json["postal_code"] is String) {
      postalCode = json["postal_code"];
    }
    if (json["street"] is String) {
      street = json["street"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["created_at"] = createdAt;
    if (phones != null) {
      data["phones"] = phones;
    }
    if (companyEmails != null) {
      data["company_emails"] = companyEmails;
    }
    data["company_name"] = companyName;
    data["state"] = state;
    data["country"] = country;
    data["city"] = city;
    data["postal_code"] = postalCode;
    data["street"] = street;
    return data;
  }
}
