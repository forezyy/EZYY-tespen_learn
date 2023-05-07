cardsFromJson(List<dynamic> list) =>
    List<CardModel>.from(list.map((json) => CardModel.fromJson(json)));

class CardModel {
  final String id;
  final String name;
  final String number;
  final num balance;
  final String balanceText;

  CardModel(
      {required this.id,
      required this.name,
      required this.number,
      required this.balance,
      required this.balanceText});

  static CardModel fromJson(Map<String, dynamic> json) => CardModel(
      id: json['id'],
      name: json['name'],
      number: json['number'],
      balance: json['balance'],
      balanceText: json['balanceText']);
}
