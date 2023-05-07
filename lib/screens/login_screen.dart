import 'package:ezy_tespen_learn/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/authentication_bloc.dart';
import '../bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Future<bool> loginAction(String email, String password) async {
    print(email);
    print(password);
    Future.delayed(Duration(seconds: 3));
    return true;
  }

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
                        loginAction(state.email, state.password).then((value) {
                          if (value == true) {
                            context
                                .read<AuthenticationBloc>()
                                .add(AuthenticateEvent(state.email));

                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
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
          decoration: InputDecoration(hintText: "Password"),
          onChanged: (value) {
            context.read<LoginBloc>().add(PasswordChangedEvent(value));
          },
        );
      });
}
