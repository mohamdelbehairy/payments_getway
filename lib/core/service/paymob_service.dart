import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:payments_getway/core/service/api_service.dart';
import 'package:payments_getway/core/utils/api_key.dart';
import 'package:payments_getway/models/paymob_models/authentication_model.dart';

import '../../models/paymob_models/order_registration_output.dart';

class PaymobService {
  final ApiService apiService = ApiService();

  Future<AuthenticationModel> authentication() async {
    var response = await apiService.post(
      url: 'https://accept.paymob.com/api/auth/tokens',
      body: {
        "api_key": ApiKey.paymobApiKey,
      },
      contentType: Headers.jsonContentType,
    );
    var authentication = AuthenticationModel.fromJson(response.data);
    log('first token: ${authentication.token}');
    return authentication;
  }

  Future<OrderRegistrationOutput> orderRegistration(
      {required String authToken, required String price}) async {
    var response = await apiService.post(
      url: 'https://accept.paymob.com/api/ecommerce/orders',
      body: {
        "auth_token": authToken,
        "delivery_needed": "false",
        "amount_cents": "1000",
        "currency": "EGP",
        "items": [],
      },
      headers: {
        'Content-Type': 'application/json',
      },
      contentType: Headers.jsonContentType,
    );
    var orderRegistration = OrderRegistrationOutput.fromJson(response.data);
    log('id: ${orderRegistration.id}');
    return orderRegistration;
  }

  Future<String> paymentKey(
      {required num price,
      required String orderID,
      required String authToken}) async {
    var response = await apiService.post(
      url: 'https://accept.paymob.com/api/acceptance/payment_keys',
      body: {
        "auth_token": authToken,
        "amount_cents": 109,
        "expiration": 3600,
        "order_id": orderID,
        "billing_data": {
          "apartment": "NA",
          "email": "NA",
          "floor": "NA",
          "first_name": "NA",
          "street": "NA",
          "building": "NA",
          "phone_number": "NA",
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "last_name": "NA",
          "state": "NA"
        },
        "currency": "EGP",
        "integration_id": ApiKey.paymobIntegrationID
      },
      headers: {
        'Content-Type': 'application/json',
      },
      contentType: Headers.jsonContentType,
    );
    log('token: ${response.data['token']}');
    return response.data['token'];
  }

  Future<String> makePayment({required String price}) async {
    var auth = await authentication();
    var order = await orderRegistration(authToken: auth.token!, price: price);
    return await paymentKey(
        price: double.parse(price), orderID: order.id!.toString(), authToken: auth.token!);
  }
}
