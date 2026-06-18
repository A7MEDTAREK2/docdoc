import 'package:dio/dio.dart';
import 'package:docdoc/features/all_doctor/presentation/screens/screen%20doctor.dart';
import 'package:docdoc/features/auth/presintion/screens/login_screen.dart';
import 'package:docdoc/features/home/presintion/screens/home%20screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/all_doctor/data/data_sours/data.dart';
import 'features/all_doctor/data/repo/repo.dart';
import 'features/all_doctor/logic/cubit.dart';
import 'features/appointment/logic/_cubit.dart';
import 'features/auth/data/datasourse/dataSourse_Auth.dart';
import 'features/auth/data/repo/repo_Auth.dart';
import 'features/auth/logic/cubit_Auth.dart';
import 'features/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(AuthloginRepo(LoginImp(Dio()))),
        ),
        BlocProvider(
          create: (context) => signupCubit(AuthsignupRepo(signupImp(Dio()))),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}