import 'package:dio/dio.dart';
import 'package:ezy_tespen_learn/models/card_model.dart';
import 'package:ezy_tespen_learn/repositories/repository.dart';

class CardRepository extends Repository {
  Future<List<CardModel>> getAllCards() async {
    try {
      var response = await dio.get("cards");
      return cardsFromJson(response.data);
    } on DioError catch (e) {
      print(e);
    }

    return [];
  }
}
