import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

var dio = Dio();

class RestApiScreen extends StatelessWidget {
  const RestApiScreen({super.key});

  // void getHttp() async {
  //   var dio = Dio();
  //   final response =
  //       await dio.get('https://jsonplaceholder.typicode.com/todos/1');
  //   print(response);
  // }

  void register() async {
    try {
      final response = await dio.post(
          "https://dev-ezyycation.vercel.app/api/v1/auth/register",
          data: {
            "name": "Arif 2",
            "email": "yourmail12345@mail.com",
            "password": "StrongPassWord123"
          });
      print(response);
    } on DioError catch (e) {
      print(e.response);
    }
  }

  void login() async {
    try {
      final response = await dio
          .post("https://dev-ezyycation.vercel.app/api/v1/auth/login", data: {
        "email": "yourmail12345@mail.com",
        "password": "StrongPassWord123"
      });
      print(response);
    } on DioError catch (e) {
      print(e.response);
    }
  }

  @override
  Widget build(BuildContext context) {
    // getHttp();
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: Text("Login"),
            onPressed: () {
              login();
            },
          ),
          ElevatedButton(
            child: Text("Register"),
            onPressed: () {
              register();
            },
          ),
        ],
      )),
    );
  }
}
