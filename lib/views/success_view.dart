import 'package:flutter/material.dart';
import 'package:payments_getway/models/products_model.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key, required this.productsModel});
  final ProductsModel productsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: const Text('Success Payment',
              style: TextStyle(color: Colors.black))),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.green,
                    child: Icon(Icons.done, color: Colors.white, size: 80))),
            const SizedBox(height: 32),
            const Text('Thank you for your payment',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Text('Your transaction was successful',
                style: TextStyle(fontSize: 22, color: Colors.black87)),
            Divider(thickness: 2, color: Colors.grey.shade300, height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Text(r'$' + productsModel.price.toString(),
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
