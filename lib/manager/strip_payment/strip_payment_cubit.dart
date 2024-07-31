import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payments_getway/core/service/strip_service.dart';

import '../../models/payment_intent_input.dart';

part 'strip_payment_state.dart';

class StripPaymentCubit extends Cubit<StripPaymentState> {
  StripPaymentCubit(this.stripService) : super(StripPaymentInitial());
  final StripService stripService;

  Future<void> makePayment(
      {required PaymentIntentInput paymentIntentInput}) async {
    emit(StripPaymentLoading());
    await stripService
        .makePayment(paymentIntentInput: paymentIntentInput)
        .then((value) {
      emit(StripPaymentSuccess());
    }).catchError((e) {
      emit(StripPaymentFailure(errorMessage: e.toString()));
      debugPrint('error from get make payment method: $e');
    });
  }
}
