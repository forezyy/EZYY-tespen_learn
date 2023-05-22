import 'package:ezy_tespen_learn/bloc/authentication_bloc.dart';
import 'package:ezy_tespen_learn/screens/biometric_screen.dart';
import 'package:ezy_tespen_learn/screens/bloc_state_screen.dart';
import 'package:ezy_tespen_learn/screens/get_storage_screen.dart';
import 'package:ezy_tespen_learn/screens/home_screen.dart';
import 'package:ezy_tespen_learn/screens/home_screen_with_api.dart';
import 'package:ezy_tespen_learn/screens/location_screen.dart';
import 'package:ezy_tespen_learn/screens/login_screen.dart';
import 'package:ezy_tespen_learn/screens/login_screen_with_api.dart';
import 'package:ezy_tespen_learn/screens/rest_api_screen.dart';
import 'package:ezy_tespen_learn/screens/splash_screen.dart';
import 'package:ezy_tespen_learn/screens/statefull_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

import 'bloc/counter_bloc.dart';

void main() async {
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return locationScreen();
  }

  restApiScreen() {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RestApiScreen(),
      debugShowCheckedModeBanner: false,
    );
  }

  getStorageScreen() {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GetStorageScreen(),
      debugShowCheckedModeBanner: false,
    );
  }

  loginScreen() {
    return BlocProvider(
      create: (context) => AuthenticationBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Builder(
          builder: (context) {
            context.read<AuthenticationBloc>().add(CheckStateEvent());

            return GetStorage().hasData('email')
                ? const HomeScreen()
                : const LoginScreen();
          },
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }

  loginScreenWithApi() {
    return BlocProvider(
      create: (context) => AuthenticationBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Builder(
          builder: (context) {
            context.read<AuthenticationBloc>().add(CheckStateEvent());
            // context.read<AuthenticationBloc>().add(LogoutEvent());

            return GetStorage().hasData('email')
                ? HomeScreenWithApi()
                : LoginScreenWithApi();
          },
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }

  multiBlocProvider() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const BlocStateScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }

  blocProvider() {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const BlocStateScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }

  statefullWidget() {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StatefulScreen(),
      debugShowCheckedModeBanner: false,
    );
  }

  biometricScreen() {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BiometricScreen(),
      debugShowCheckedModeBanner: false,
    );
  }

  locationScreen() {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LocationScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
