import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payments_getway/core/service/api_service.dart';
import 'package:payments_getway/models/strip_models/create_customer_model.dart';
import 'package:payments_getway/models/strip_models/epemeral_key_model.dart';
import 'package:payments_getway/models/strip_models/init_payment_model.dart';
import 'package:payments_getway/models/strip_models/payment_intent_input.dart';
import 'package:payments_getway/models/strip_models/payment_intent_output.dart';

import '../utils/api_key.dart';

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

  Future<void> initPaymentSheet(
      {required InitPaymentModel initPaymentModel}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            merchantDisplayName: 'Manchester United',
            paymentIntentClientSecret: initPaymentModel.clientSecret,
            customerId: initPaymentModel.customID,
            customerEphemeralKeySecret: initPaymentModel.ephemeralKey));
  }

  Future<void> displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerID}) async {
    var response = await apiService.post(
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      headers: {
        'Authorization': 'Bearer ${ApiKey.stripSecretKey}',
        'Stripe-Version': '2024-06-20'
      },
      body: {
        'customer': customerID,
      },
    );
    var ephemeralKey = EphemeralKeyModel.fromJson(response.data);
    return ephemeralKey;
  }

  Future<CreateCustomerModel> createCustomer() async {
    var response = await apiService.post(
      url: 'https://api.stripe.com/v1/customers',
      body: {
        'name': FirebaseAuth.instance.currentUser!.displayName,
        'id': FirebaseAuth.instance.currentUser!.uid,
      },
    );
    var createCustomer = CreateCustomerModel.fromJson(response.data);
    return createCustomer;
  }

  Future<void> makePayment(
      {required PaymentIntentInput paymentIntentInput}) async {
    var createPayment = await createPaymentIntent(paymentIntentInput);
    var createEphemeral =
        await createEphemeralKey(customerID: paymentIntentInput.customerID);

    await initPaymentSheet(
        initPaymentModel: InitPaymentModel(
            clientSecret: createPayment.clientSecret!,
            customID: paymentIntentInput.customerID,
            ephemeralKey: createEphemeral.secret!));
    await displayPaymentSheet();
  }
}
