import 'package:flutter/material.dart';

import '../core/utils/widgets/custom_button.dart';
import '../core/utils/widgets/custom_image.dart';
import '../models/products_model.dart';
import 'payment_ways_bottom_sheet.dart';

class ProductViewBody extends StatelessWidget {
  const ProductViewBody({super.key, required this.productsModel});

  final ProductsModel productsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Align(
              alignment: Alignment.center,
              child:
                  CustomImage(imageHight: 300, imageUrl: productsModel.image)),
          const SizedBox(height: 12),
          Text(productsModel.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Divider(color: Colors.grey.shade300, thickness: .5, height: 30),
          Text(productsModel.description,
              textAlign: TextAlign.center,
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                  fontSize: 14)),
          const Spacer(),
          CustomButton(
              buttonName: 'Buy Now',
              onPressed: () => showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.white,
                  builder: (context) =>
                      PaymentWaysBottomSheet(productsModel: productsModel))),
          const SizedBox(height: 28),
        ],
      ),
    );
  }
}
