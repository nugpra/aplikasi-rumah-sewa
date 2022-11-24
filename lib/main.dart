import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housequ/cubit/auth_cubit.dart';
import 'package:housequ/cubit/city_cubit.dart';
import 'package:housequ/cubit/page_cubit.dart';
import 'package:housequ/ui/pages/details_page.dart';
import 'package:housequ/ui/pages/get_started_page.dart';
import 'package:housequ/ui/pages/main_page.dart';
import 'package:housequ/ui/pages/sign_in.dart';
import 'package:housequ/ui/pages/sign_up_page.dart';

import 'ui/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => CityCubit(),
        )
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, routes: {
        '/': (context) => SplashPage(),
        '/get-started': (context) => GetStartedPage(),
        '/sign-up': (context) => SignUpPage(),
        '/sign-in': (context) => SignInPage(),
        '/main': (context) => MainPage(),
      }),
    );
  }
}
