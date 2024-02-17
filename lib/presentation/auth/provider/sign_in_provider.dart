import 'package:dio/dio.dart';
import 'package:dreamer_flutter/presentation/auth/model/sign_in_model.dart';
import 'package:dreamer_flutter/secret.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signInProvider = StateNotifierProvider<SignInNotifier, SignInState>(
  (ref) => SignInNotifier(),
);

enum SignInState {
  initial,
  loading,
  success,
  failure,
}

class SignInNotifier extends StateNotifier<SignInState> {
  SignInNotifier() : super(SignInState.initial);

  Future<void> signIn(
    String email,
    String password,
  ) async {
    Dio dio = Dio();

    Map<String, dynamic> data = {
      "Email": email,
      "Password": password,
    };

    try {
      state = SignInState.loading;
      final resp = await dio.post(
        '$baseUrl/u/login',
        options: Options(headers: {
          "Content-Type": "application/json",
        }),
        data: data,
      );
      if (resp.statusCode == 200) {
        state = SignInState.success;
        print(resp.data['accessToken']);
        accessToken = resp.data['accessToken'];
      }
    } catch (e) {
      state = SignInState.failure;
      throw Exception(e.toString());
    }
  }
}
