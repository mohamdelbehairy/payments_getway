class PaymentIntentInput {
  final int amount;
  final String currency, customerID;

  PaymentIntentInput(
      {required this.amount, required this.currency, required this.customerID});

  toJson() {
    return {
      'amount': amount,
      'currency': currency,
      'customer': customerID,
    };
  }
}
