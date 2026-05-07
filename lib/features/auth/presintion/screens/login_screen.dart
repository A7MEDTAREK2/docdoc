import 'package:docdoc/core/theming/colors%20manegments.dart';
import 'package:docdoc/core/theming/txt_style.dart';
import 'package:docdoc/core/widgets/app_botton.dart';
import 'package:docdoc/core/widgets/txtfield.dart';
import 'package:docdoc/features/auth/logic/cubit.dart';
import 'package:docdoc/features/auth/logic/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../core/theming/icons.dart';
import '../../data/request_body.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorsmanegments.backgroundapp,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(

                  minHeight: constraints.maxHeight,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    // LOGO
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "lib/core/assets/Container.png",
                        width: 21,
                        height: 25,
                      ),
                      const SizedBox(width: 6),
                      Image.asset(
                        "lib/core/assets/Heading 1.png",
                        width: 204,
                        height: 40,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // TEXT
                  Text("Welcome back", style: TxtStyle.size24w400black),
                  const SizedBox(height: 8),
                  Text(
                    "Please enter your details to sign in.",
                    style: TxtStyle.size16w300black,
                  ),
                  const SizedBox(height: 20),

                  // Inputs
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Email Address",
                          style: TxtStyle.size12w400black,

                        ),
                      ),
                      Txtfield(hintText: "name@example.com",
                        prefixIcon: Iconss.email,
                        controller: emailController,),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Password", style: TxtStyle
                            .size12w400black),
                      ),
                      Txtfield(hintText: "password",
                          prefixIcon: Iconss.pass,
                          controller: passwordController),

                    ],
                  ),
                  const SizedBox(height: 30),

                  // Button
                  BlocConsumer<LoginCubit, AuthState>(
                    listener: (context, state) {
                      if (state is  AuthLoadedState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Success Login"),
                              backgroundColor: Colors.green),
                        );

                      } else if (state is AuthErrorState) {

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.message),
                              backgroundColor: Colors.red),
                        );
                      }
                    },
                    builder:(context , state){if (state is AuthLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                    return AppBotton(width: double.infinity, txt: "Log In", onTap: () {

                    context.read<LoginCubit>().login(
                      RequestBody(
                        email: emailController.text,
                        password: passwordController.text,
                      ),
                    );
                  },
                    );
                  },
                  ),
                    const SizedBox(height: 15),

                    // Sign up Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account? "),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const Signup()),
                            );
                          },
                          child: Text("Sign up",
                              style: TxtStyle.size14w800primary),
                        ),
                      ],
                    ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}