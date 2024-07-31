import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payments_getway/core/utils/api_key.dart';

import 'core/service/get_products_service.dart';
import 'core/service/strip_service.dart';
import 'core/utils/bloc_observer.dart';
import 'manager/get_products/get_products_cubit.dart';
import 'manager/strip_payment/strip_payment_cubit.dart';
import 'views/home_view.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  Stripe.publishableKey = ApiKey.publishableKey;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => GetProductsCubit(GetProductsService())),
        BlocProvider(create: (context) => StripPaymentCubit(StripService())),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
