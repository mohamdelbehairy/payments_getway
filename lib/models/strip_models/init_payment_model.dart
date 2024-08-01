class InitPaymentModel {
  final String clientSecret, customID, ephemeralKey;

  InitPaymentModel(
      {required this.clientSecret,
      required this.customID,
      required this.ephemeralKey});
}
