import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payments_getway/core/service/paymob_service.dart';

part 'paymob_payment_state.dart';

class PaymobPaymentCubit extends Cubit<PaymobPaymentState> {
  PaymobPaymentCubit(this.paymobService) : super(PaymobPaymentInitial());
  final PaymobService paymobService;

  String token = '';
  Future<void> makePayment({required String price}) async {
    emit(PaymobPaymentLoading());
    await paymobService.makePayment(price: price).then((value) {
      token = value;
      emit(PaymobPaymentSuccess());
    }).catchError((e) {
      emit(PaymobPaymentFailure(errorMessage: e.toString()));
      debugPrint('error from get make payment method: $e');
    });
  }
}
