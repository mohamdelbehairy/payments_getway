import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/utils/widgets/custom_circle_indicator.dart';
import '../manager/get_products/get_products_cubit.dart';
import 'product_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var products = context.read<GetProductsCubit>();
    return BlocBuilder<GetProductsCubit, GetProductsState>(
      builder: (context, state) {
        if (state is GetProductsLoading) {
          return const CustomCircleIndicator();
        }
        return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: products.products.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ProductItem(productsModel: products.products[index]));
            });
      },
    );
  }
}

