import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payments_getway/models/products_model.dart';

import '../../../manager/strip_payment/strip_payment_cubit.dart';
import '../../../models/strip_model/payment_intent_input.dart';

Future<void> payUsingCard(BuildContext context, ProductsModel productModel) async {
  await BlocProvider.of<StripPaymentCubit>(context).makePayment(
      paymentIntentInput:
          PaymentIntentInput(amount: (productModel.price * 100).toInt(), currency: "USD"));
}
