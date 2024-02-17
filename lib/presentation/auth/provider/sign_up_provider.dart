import 'package:dreamer_flutter/secret.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

final signUpProvider = StateNotifierProvider<SignUpNotifier, SignUpState>(
  (ref) => SignUpNotifier(),
);

enum SignUpState {
  initial,
  loading,
  success,
  failure,
}

class SignUpNotifier extends StateNotifier<SignUpState> {
  SignUpNotifier() : super(SignUpState.initial);

  Future<void> signUp(
    String name,
    String email,
    String password,
    String profile,
  ) async {
    Dio dio = Dio();

    Map<String, dynamic> data = {
      "Name": name,
      "Email": email,
      "Password": password,
      "Profile": profile,
    };
    try {
      state = SignUpState.loading;
      final resp = await dio.post(
        "$baseUrl/u/join",
        options: Options(headers: {
          "Content-Type": "application/json",
        }),
        data: data,
      );
      if (resp.statusCode == 200) {
        state = SignUpState.success;
      } else {
        state = SignUpState.failure;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
