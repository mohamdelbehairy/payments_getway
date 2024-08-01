part of 'paymob_payment_cubit.dart';

sealed class PaymobPaymentState {}

final class PaymobPaymentInitial extends PaymobPaymentState {}

final class PaymobPaymentLoading extends PaymobPaymentState {}

final class PaymobPaymentSuccess extends PaymobPaymentState {}

final class PaymobPaymentFailure extends PaymobPaymentState {
  final String errorMessage;

  PaymobPaymentFailure({required this.errorMessage});
}
