import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payments_getway/core/utils/helper/pay_using_paymob.dart';
import 'package:payments_getway/core/utils/helper/pay_using_paypal.dart';
import 'package:payments_getway/manager/paymob_payment/paymob_payment_cubit.dart';
import 'package:payments_getway/manager/strip_payment/strip_payment_cubit.dart';
import 'package:payments_getway/models/products_model.dart';
import 'package:payments_getway/views/paymob_visa_view.dart';

import '../core/utils/helper/pay_using_card.dart';
import '../core/utils/widgets/custom_button.dart';
import '../views/success_view.dart';

class PaymentWaysButton extends StatelessWidget {
  const PaymentWaysButton(
      {super.key, required this.activeIndex, required this.productsModel});

  final int activeIndex;
  final ProductsModel productsModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymobPaymentCubit, PaymobPaymentState>(
      listener: (context, paymobState) {
        if (paymobState is PaymobPaymentSuccess) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const PaymobVisaView()));
        }
      },
      builder: (context, paymobState) {
        return BlocConsumer<StripPaymentCubit, StripPaymentState>(
          listener: (context, stripState) {
            if (stripState is StripPaymentSuccess) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      SuccessView(productsModel: productsModel),
                ),
              );
            }
            if (stripState is StripPaymentFailure) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(stripState.errorMessage.toString())));
            }
          },
          builder: (context, stripState) {
            return CustomButton(
                isLoading: stripState is StripPaymentLoading ||
                        paymobState is PaymobPaymentLoading
                    ? true
                    : false,
                buttonHeight: 50,
                buttonName: activeIndex == 0
                    ? 'Pay using card'
                    : activeIndex == 1
                        ? 'Pay using paypal'
                        : 'Pay using paymob',
                onPressed: () async {
                  if (activeIndex == 0) {
                    await payUsingCard(context, productsModel);
                  } else if (activeIndex == 1) {
                    payUsingPaypal(
                        context: context, productModel: productsModel);
                  } else {
                    await payUsingPaymob(
                        context: context, productModel: productsModel);
                  }
                });
          },
        );
      },
    );
  }
}
