import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<EmailChangedEvent>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordChangedEvent>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
  }
}
