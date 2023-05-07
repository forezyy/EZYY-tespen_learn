import 'package:ezy_tespen_learn/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/authentication_bloc.dart';
import '../bloc/login_bloc.dart';
import 'home_screen_with_api.dart';

class LoginScreenWithApi extends StatelessWidget {
  LoginScreenWithApi({super.key});

  final authRepository = AuthRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _emailInput(),
              _passwordInput(),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return Text('Email: ${state.email}');
                },
              ),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return Text('Password: ${state.password}');
                },
              ),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return ElevatedButton(
                      onPressed: () {
                        authRepository
                            .login(state.email, state.password)
                            .then((value) {
                          if (value.token != '') {
                            context
                                .read<AuthenticationBloc>()
                                .add(AuthenticateEvent(value.token));

                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => HomeScreenWithApi(),
                                ),
                                (route) => false);
                          }
                        });
                      },
                      child: Text("login"));
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _emailInput() => Builder(builder: (context) {
        return TextFormField(
          decoration: InputDecoration(hintText: "Email"),
          onChanged: (value) {
            context.read<LoginBloc>().add(EmailChangedEvent(value));
          },
        );
      });

  Widget _passwordInput() => Builder(builder: (context) {
        return TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Password",
          ),
          onChanged: (value) {
            context.read<LoginBloc>().add(PasswordChangedEvent(value));
          },
        );
      });
}
