import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(const AuthenticationState()) {
    on<AuthenticateEvent>((event, emit) {
      GetStorage().write('email', event.email);
      emit(state.copyWith(hasLogged: true, email: event.email));
    });
    on<LogoutEvent>((event, emit) async {
      await GetStorage().remove('email');
      emit(state.copyWith(hasLogged: false, email: ''));
    });
    on<CheckStateEvent>((event, emit) {
      if (GetStorage().hasData('email')) {
        emit(
            state.copyWith(email: GetStorage().read('email'), hasLogged: true));
      }
    });
  }
}
