import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payments_getway/models/paypal_model/amount_model.dart';
import 'package:payments_getway/models/paypal_model/item_list_model.dart';
import 'package:payments_getway/models/products_model.dart';

import '../api_key.dart';

void payUsingPaypal(
    {required BuildContext context,
    required ProductsModel productModel}) async {
  var getData = getTransactionData(productModel);
  Navigator.of(context).push(MaterialPageRoute(
    builder: (BuildContext context) => PaypalCheckoutView(
      sandboxMode: true,
      clientId: ApiKey.paypalClienID,
      secretKey: ApiKey.paypalSecretKey,
      transactions: [
        {
          "amount": getData.amountModel.toJson(),
          "description": "The payment transaction description.",
          "item_list": getData.itemList.toJson()
        }
      ],
      note: "Contact us for any questions on your order.",
      onSuccess: (Map params) async {
        log("onSuccess: $params");
        Navigator.pop(context);
      },
      onError: (error) {
        log("onError: $error");
        Navigator.pop(context);
      },
      onCancel: () {
        log('cancelled:');
        Navigator.pop(context);
      },
    ),
  ));
}

({AmountModel amountModel, ItemListModel itemList}) getTransactionData(
    ProductsModel productModel) {
  var amountModel = AmountModel(
      total: productModel.price.toString(),
      currency: 'USD',
      details: Details(
          subtotal: productModel.price.toString(),
          shipping: '0',
          shippingDiscount: 0));
  List<Items> items = [
    Items(
      name: productModel.title,
      quantity: 1,
      price: productModel.price.toString(),
      currency: 'USD',
    )
  ];
  var itemList = ItemListModel(items: items);
  return (amountModel: amountModel, itemList: itemList);
}
