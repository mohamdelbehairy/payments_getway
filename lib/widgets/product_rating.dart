import 'package:flutter/material.dart';
import 'package:payments_getway/models/products_model.dart';

class ProductRating extends StatelessWidget {
  const ProductRating({super.key, required this.productsModel});
  final ProductsModel productsModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.orangeAccent, size: 18),
        const SizedBox(width: 4),
        Text(productsModel.rating.rate.toString(),
            style: const TextStyle(
                color: Colors.black54, fontWeight: FontWeight.w500))
      ],
    );
  }
}
