import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payments_getway/core/service/google_auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'google_auth_state.dart';

class GoogleAuthCubit extends Cubit<GoogleAuthState> {
  GoogleAuthCubit(this.googleAuthService) : super(GoogleAuthInitial());
  final GoogleAuthService googleAuthService;

  Future<void> signInWithGoogle() async {
    emit(GoogleAuthLoading());
    await googleAuthService.signInWithGoogle().then((value) async {
      if (value != null) {
        final pref = await SharedPreferences.getInstance();
        pref.setString('userID', value.user!.uid);
        emit(GoogleAuthSucess());
      }
    }).catchError((e) {
      emit(GoogleAuthFailure(errorMessage: e.toString()));
      debugPrint('error from signInWithGoogle method: $e');
    });
  }

  Future<void> signOut() async {
    await googleAuthService.signOut();
    emit(SignoutSucess());
  }
}
