import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentWayItem extends StatelessWidget {
  const PaymentWayItem(
      {super.key,
      required this.imageurl,
      this.height,
      required this.onTap,
      required this.isActive});
  final String imageurl;
  final double? height;
  final Function() onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 62,
        width: 103,
        margin: const EdgeInsets.only(top: 24, bottom: 32),
        decoration: BoxDecoration(
            border: Border.all(
                width: isActive ? 1.5 : 1,
                color: isActive ? const Color(0xff34A853) : Colors.grey),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: isActive ? const Color(0xff34A853) : Colors.white,
                spreadRadius: 0,
                blurRadius: isActive ? 4.0 : 0.0,
                offset: const Offset(0, 0), // changes position of shadow
              )
            ]),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: SvgPicture.asset(imageurl,
                height: height ?? 30, fit: BoxFit.scaleDown),
          ),
        ),
      ),
    );
  }
}
