import 'package:flutter/material.dart';
import 'package:payments_getway/models/products_model.dart';

import '../widgets/product_view_model.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.productsModel});
  final ProductsModel productsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: ProductViewBody(productsModel: productsModel),
    );
  }
}
