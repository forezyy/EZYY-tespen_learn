import 'package:dio/dio.dart';
import 'package:ezy_tespen_learn/repositories/repository.dart';

import '../models/authentication_model.dart';

class AuthRepository extends Repository {
  Future<AuthenticationModel> login(String email, String password) async {
    try {
      var response = await dio
          .post("auth/login", data: {"email": email, "password": password});

      return AuthenticationModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.response);
    }

    return AuthenticationModel(token: "");
  }

  Future<AuthenticationModel> register(
      String name, String email, String password) async {
    try {
      var response = await dio.post("auth/login",
          data: {"name": name, "email": email, "password": password});

      return AuthenticationModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.response);
    }

    return AuthenticationModel(token: "");
  }
}
