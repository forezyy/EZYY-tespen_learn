import 'package:ezy_tespen_learn/services/biometric.dart';
import 'package:flutter/material.dart';

class BiometricScreen extends StatelessWidget {
  BiometricScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        child: const Text("Authenticate"),
        onPressed: () async {
          var isAuthenticated = await BiometricService.authenticate();

          print(isAuthenticated);
        },
      )),
    );
  }
}
