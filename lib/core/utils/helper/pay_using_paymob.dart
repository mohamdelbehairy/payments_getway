import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../manager/currency/currency_cubit.dart';
import '../../../manager/paymob_payment/paymob_payment_cubit.dart';
import '../../../models/products_model.dart';

Future<void> payUsingPaymob(
    {required BuildContext context,
    required ProductsModel productModel}) async {
  var curreny = context.read<CurrencyCubit>();
  var makePayment = context.read<PaymobPaymentCubit>();
  String roundPrice = curreny.egp.toStringAsFixed(2);
  double price = double.parse(roundPrice);
  dynamic totalPrice = productModel.price * price;
  String roundTotalPrice = totalPrice.toStringAsFixed(2);
  totalPrice = double.parse(roundTotalPrice);

  await makePayment.makePayment(price: (totalPrice * 100).toString());
}
