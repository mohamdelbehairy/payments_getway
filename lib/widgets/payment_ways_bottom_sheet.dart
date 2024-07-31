import 'package:flutter/material.dart';
import 'package:payments_getway/core/utils/assets.dart';
import 'package:payments_getway/models/products_model.dart';

import 'payment_way_item.dart';
import 'payment_ways_button.dart';

class PaymentWaysBottomSheet extends StatefulWidget {
  const PaymentWaysBottomSheet({super.key, required this.productsModel});
  final ProductsModel productsModel;

  @override
  State<PaymentWaysBottomSheet> createState() => _PaymentWaysBottomSheetState();
}

class _PaymentWaysBottomSheetState extends State<PaymentWaysBottomSheet> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              PaymentWayItem(
                  imageurl: Assets.imagesCard,
                  onTap: () {
                    setState(() {
                      activeIndex = 0;
                    });
                  },
                  isActive: activeIndex == 0),
              const SizedBox(width: 12),
              PaymentWayItem(
                  imageurl: Assets.imagesPaypal,
                  onTap: () {
                    setState(() {
                      activeIndex = 1;
                    });
                  },
                  isActive: activeIndex == 1),
              const SizedBox(width: 12),
              PaymentWayItem(
                  imageurl: Assets.imagesPaymob,
                  height: 20,
                  onTap: () {
                    setState(() {
                      activeIndex = 2;
                    });
                  },
                  isActive: activeIndex == 2),
            ],
          ),
          PaymentWaysButton(
              activeIndex: activeIndex, productsModel: widget.productsModel),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
