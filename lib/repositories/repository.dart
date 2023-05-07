import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class Repository {
  late Dio dio;
  String baseUrl = "https://dev-ezyycation.vercel.app/api/v1/";

  Repository() {
    var hasToken = GetStorage().hasData('email');

    dio = Dio(BaseOptions(baseUrl: baseUrl, headers: {
      "Authorization": hasToken ? "Bearer ${GetStorage().read('email')}" : null
    }));
  }
}
