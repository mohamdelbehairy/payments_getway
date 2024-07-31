import 'package:flutter/material.dart';
import 'package:payments_getway/models/products_model.dart';
import 'package:payments_getway/views/product_view.dart';

import '../core/utils/widgets/custom_image.dart';
import 'product_info.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productsModel});
  final ProductsModel productsModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductView(productsModel: productsModel))),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            const SizedBox(width: 12),
            SizedBox(
                width: MediaQuery.sizeOf(context).width * .2,
                child: CustomImage(imageUrl: productsModel.image)),
            const SizedBox(width: 12),
            ProductInfo(productsModel: productsModel)
          ],
        ),
      ),
    );
  }
}
