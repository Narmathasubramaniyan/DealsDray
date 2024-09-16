import 'package:dealsdray/bloc/email/email_bloc.dart'; // Add import for EmailBloc
import 'package:dealsdray/bloc/login/login_bloc.dart';
import 'package:dealsdray/bloc/splash/splash_bloc.dart';
import 'package:dealsdray/repository/email/email_impl.dart';
import 'package:dealsdray/repository/login/login_impl.dart';
import 'package:dealsdray/repository/splash/splash_impl.dart';
import 'package:dealsdray/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final splashImpl = SplashImpl();
    final loginImpl = LoginImpl();
    final emailImpl = EmailRepositoryImpl();

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => splashImpl),
        RepositoryProvider(create: (_) => loginImpl),
        RepositoryProvider(create: (_) => emailImpl),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => SplashBloc(splashImpl: splashImpl)),
          BlocProvider(create: (_) => LoginBloc(loginImpl)),
          BlocProvider(create: (_) => EmailBloc(emailImpl)),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => const SplashScreen(),
          },
        ),
      ),
    );
  }
}
