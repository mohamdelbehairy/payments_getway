import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payments_getway/core/utils/helper/pay_using_paypal.dart';
import 'package:payments_getway/manager/strip_payment/strip_payment_cubit.dart';
import 'package:payments_getway/models/products_model.dart';

import '../core/utils/helper/pay_using_card.dart';
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
              if (activeIndex == 0) {
                await payUsingCard(context, productsModel);
              } else if (activeIndex == 1) {
                payUsingPaypal(context: context, productModel: productsModel);
              }
            });
      },
    );
  }
}
