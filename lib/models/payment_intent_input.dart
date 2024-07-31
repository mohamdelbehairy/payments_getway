class PaymentIntentInput {
  final int amount;
  final String currency;

  PaymentIntentInput({required this.amount, required this.currency});

  toJson() {
    return {
      'amount': amount,
      'currency': currency,
    };
  }
}
