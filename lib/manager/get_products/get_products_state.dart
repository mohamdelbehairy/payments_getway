part of 'get_products_cubit.dart';

sealed class GetProductsState {}

final class GetProductsInitial extends GetProductsState {}

final class GetProductsLoading extends GetProductsState {}

final class GetProductsSuccess extends GetProductsState {}

final class GetProductsFailure extends GetProductsState {
  final String errorMessage;

  GetProductsFailure({required this.errorMessage});
}
