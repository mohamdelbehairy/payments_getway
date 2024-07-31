import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payments_getway/manager/strip_payment/strip_payment_cubit.dart';
import 'package:payments_getway/models/payment_intent_input.dart';
import 'package:payments_getway/models/products_model.dart';

import '../core/utils/widgets/custom_button.dart';

class PaymentWaysButton extends StatelessWidget {
  const PaymentWaysButton(
      {super.key, required this.activeIndex, required this.productsModel});

  final int activeIndex;
  final ProductsModel productsModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StripPaymentCubit, StripPaymentState>(
      listener: (context, state) {
        if (state is StripPaymentSuccess) {}
        if (state is StripPaymentFailure) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage.toString())));
        }
      },
      builder: (context, state) {
        return CustomButton(
            isLoading: state is StripPaymentLoading ? true : false,
            buttonHeight: 50,
            buttonName: activeIndex == 0
                ? 'Pay using card'
                : activeIndex == 1
                    ? 'Pay using paypal'
                    : 'Pay using paymob',
            onPressed: () async {
              log('Price: ${productsModel.price}, Type: ${productsModel.price.runtimeType}');
              if (activeIndex == 0) {
                await BlocProvider.of<StripPaymentCubit>(context).makePayment(
                    paymentIntentInput: PaymentIntentInput(
                        amount: (productsModel.price * 100).toInt(),
                        currency: "USD"));
              }
            });
      },
    );
  }
}
