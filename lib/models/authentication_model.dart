class AuthenticationModel {
  final String token;

  AuthenticationModel({required this.token});

  static AuthenticationModel fromJson(Map<String, dynamic> json) =>
      AuthenticationModel(token: json['token']);
}
