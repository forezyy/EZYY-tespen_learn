import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class GetStorageScreen extends StatelessWidget {
  const GetStorageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // GetStorage().write('name', "Arif Iskandar");

    var name = GetStorage().read('name');

    return Scaffold(
      body: Center(child: Text("$name")),
    );
  }
}
