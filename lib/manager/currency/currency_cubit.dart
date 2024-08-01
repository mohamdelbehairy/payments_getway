import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payments_getway/core/service/currency_service.dart';

part 'currency_state.dart';

class CurrencyCubit extends Cubit<CurrencyState> {
  CurrencyCubit(this.currencyService) : super(CurrencyInitial());
  final CurrencyService currencyService;

  double egp = 0.0;
  Future<void> getCurrency() async {
    emit(CurrencyLoading());
    await currencyService.getCurrency().then((value) {
      egp = value.result!.egp!;
      emit(CurrencySuccess());
    }).catchError((e) {
      emit(CurrencyFailure(errorMessage: e.toString()));
      debugPrint('error from getCurrency method: $e');
    });
  }
}
