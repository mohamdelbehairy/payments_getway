import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payments_getway/manager/get_products/get_products_cubit.dart';
import 'package:payments_getway/manager/google_auth/google_auth_cubit.dart';
import 'package:payments_getway/views/login_view.dart';

import '../widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetProductsCubit>(context).getProducts();
    return Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: const Text('Recommended Products',
              style: TextStyle(color: Colors.white)),
          actions: [
            BlocListener<GoogleAuthCubit, GoogleAuthState>(
              listener: (context, state) {
                if (state is SignoutSucess) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const LoginView()),
                      (route) => false);
                }
              },
              child: IconButton(
                  onPressed: () async {
                    await BlocProvider.of<GoogleAuthCubit>(context).signOut();
                  },
                  icon: const Icon(Icons.logout, color: Colors.white)),
            ),
          ],
        ),
        body: const HomeViewBody());
  }
}
