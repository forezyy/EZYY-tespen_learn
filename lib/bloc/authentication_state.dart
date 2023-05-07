part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  final bool hasLogged;
  final String email;

  const AuthenticationState({this.email = '', this.hasLogged = false});

  AuthenticationState copyWith({String? email, bool? hasLogged}) =>
      AuthenticationState(
          email: email ?? this.email, hasLogged: hasLogged ?? this.hasLogged);

  @override
  List<Object> get props => [email, hasLogged];
}
