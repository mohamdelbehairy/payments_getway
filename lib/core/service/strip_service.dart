import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payments_getway/core/service/api_service.dart';
import 'package:payments_getway/models/strip_model/payment_intent_input.dart';
import 'package:payments_getway/models/strip_model/payment_intent_output.dart';

class StripService {
  final ApiService apiService = ApiService();
  Future<PaymentIntentOutput> createPaymentIntent(
      PaymentIntentInput paymentIntentInput) async {
    var respone = await apiService.post(
      url: 'https://api.stripe.com/v1/payment_intents',
      body: paymentIntentInput.toJson(),
    );
    var paymentIntent = PaymentIntentOutput.fromJson(respone.data);
    return paymentIntent;
  }

  Future<void> initPaymentSheet({required String clientSecret}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      merchantDisplayName: 'Manchester United',
      paymentIntentClientSecret: clientSecret,
    ));
  }

  Future<void> displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<void> makePayment(
      {required PaymentIntentInput paymentIntentInput}) async {
    var createPayment = await createPaymentIntent(paymentIntentInput);
    await initPaymentSheet(clientSecret: createPayment.clientSecret!);
    await displayPaymentSheet();
  }
}
