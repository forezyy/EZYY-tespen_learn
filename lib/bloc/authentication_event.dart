part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticateEvent extends AuthenticationEvent {
  final String email;

  const AuthenticateEvent(this.email);

  @override
  List<Object> get props => [email];
}

class LogoutEvent extends AuthenticationEvent {}

class CheckStateEvent extends AuthenticationEvent {}
