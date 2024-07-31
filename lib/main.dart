import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payments_getway/core/service/google_auth_service.dart';
import 'package:payments_getway/core/utils/api_key.dart';
import 'package:payments_getway/firebase_options.dart';
import 'package:payments_getway/manager/google_auth/google_auth_cubit.dart';
import 'package:payments_getway/views/home_view.dart';
import 'package:payments_getway/views/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/service/get_products_service.dart';
import 'core/service/strip_service.dart';
import 'core/utils/bloc_observer.dart';
import 'manager/get_products/get_products_cubit.dart';
import 'manager/strip_payment/strip_payment_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  Stripe.publishableKey = ApiKey.publishableKey;
  await _init();
}

Future<void> _init() async {
  final pref = await SharedPreferences.getInstance();
  final userID = pref.getString('userID');
  return runApp(
      MyApp(views: userID != null ? const HomeView() : const LoginView()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.views});
  final Widget views;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => GetProductsCubit(GetProductsService())),
        BlocProvider(create: (context) => StripPaymentCubit(StripService())),
        BlocProvider(create: (context) => GoogleAuthCubit(GoogleAuthService()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: views,
      ),
    );
  }
}
