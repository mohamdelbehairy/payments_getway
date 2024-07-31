import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payments_getway/views/home_view.dart';

import '../manager/google_auth/google_auth_cubit.dart';
import 'continue_with_google_item.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<GoogleAuthCubit, GoogleAuthState>(
      listener: (context, state) {
        if (state is GoogleAuthSucess) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const HomeView()),
              (route) => false);
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Align(
              alignment: Alignment.center,
              child: Text('Resgister/Login',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.normal))),
          const SizedBox(height: 16),
          ContinueWithGoogleItem(onTap: () async {
            await BlocProvider.of<GoogleAuthCubit>(context).signInWithGoogle();
          }),
        ],
      ),
    );
  }
}
