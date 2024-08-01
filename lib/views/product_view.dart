import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payments_getway/manager/currency/currency_cubit.dart';
import 'package:payments_getway/models/products_model.dart';

import '../widgets/product_view_model.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key, required this.productsModel});
  final ProductsModel productsModel;

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  void initState() {
    context.read<CurrencyCubit>().getCurrency();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: ProductViewBody(productsModel: widget.productsModel),
    );
  }
}
