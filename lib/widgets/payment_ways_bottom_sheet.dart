import 'package:flutter/material.dart';
import 'package:payments_getway/core/utils/assets.dart';
import 'package:payments_getway/core/utils/widgets/custom_button.dart';

import 'payment_way_item.dart';

class PaymentWaysBottomSheet extends StatefulWidget {
  const PaymentWaysBottomSheet({super.key});

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
          CustomButton(
              buttonHeight: 50,
              buttonName: activeIndex == 0
                  ? 'Pay using card'
                  : activeIndex == 1
                      ? 'Pay using paypal'
                      : 'Pay using paymob',
              onPressed: () async {}),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
