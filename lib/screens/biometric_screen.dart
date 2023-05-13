import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class BiometricScreen extends StatelessWidget {
  BiometricScreen({super.key});

  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> isDeviceSupported() async {
    return await auth.canCheckBiometrics || await auth.isDeviceSupported();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        child: const Text("Authenticate"),
        onPressed: () async {
          var canAuthenticated = await isDeviceSupported();

          if (canAuthenticated) {
            try {
              var isSuccess = await auth.authenticate(
                localizedReason: "Gunakan FaceID untuk absen",
                options: const AuthenticationOptions(
                  useErrorDialogs: false,
                  biometricOnly: true,
                ),
              );
              if (isSuccess) {
                print("Berhasil di authenticate");
                // TODO: SEND DATA TO API
              } else {
                print("Gagal diauthenticate");
                // TODO: NOTICE USER
              }
            } on PlatformException catch (e) {
              print("Gagal diauthenticate");
              print(e);
              // TODO: NOTICE USER
            }
          } else
            print("Device tidak support");
        },
      )),
    );
  }
}
