import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payments_getway/models/products_model.dart';

import '../../core/service/get_products_service.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit(this.getProductsService) : super(GetProductsInitial());
  final GetProductsService getProductsService;

  List<ProductsModel> products = [];
  Future<void> getProducts() async {
    emit(GetProductsLoading());
    await getProductsService.getAllProducts().then((value) {
      products = value;
      emit(GetProductsSuccess());
    }).catchError((e) {
      emit(GetProductsFailure(errorMessage: e.toString()));
      debugPrint('error from get products method: $e');
    });
  }
}
