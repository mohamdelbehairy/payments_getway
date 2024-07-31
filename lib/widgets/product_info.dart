import 'package:flutter/material.dart';
import 'package:payments_getway/models/products_model.dart';

import 'product_rating.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key, required this.productsModel});
  final ProductsModel productsModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            width: MediaQuery.sizeOf(context).width * .6,
            child: Text(productsModel.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold))),
        ProductRating(productsModel: productsModel),
        const SizedBox(height: 4),
        Text(r'$' + productsModel.price.toString(),
            style: const TextStyle(
                color: Colors.black54, fontWeight: FontWeight.w500)),
      ],
    );
  }
}
